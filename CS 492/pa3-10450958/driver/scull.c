/*
 * main.c -- the bare scull char module
 *
 * Copyright (C) 2001 Alessandro Rubini and Jonathan Corbet
 * Copyright (C) 2001 O'Reilly & Associates
 *
 * The source code in this file can be freely used, adapted,
 * and redistributed in source or binary form, so long as an
 * acknowledgment appears in derived source files.  The citation
 * should list that the code comes from the book "Linux Device
 * Drivers" by Alessandro Rubini and Jonathan Corbet, published
 * by O'Reilly & Associates.   No warranty is attached;
 * we cannot take responsibility for errors or fitness for use.
 *
 */

#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/init.h>

#include <linux/kernel.h>	/* printk() */
#include <linux/slab.h>		/* kmalloc() */
#include <linux/fs.h>		/* everything... */
#include <linux/errno.h>	/* error codes */
#include <linux/types.h>	/* size_t */
#include <linux/cdev.h>

#include <linux/uaccess.h>	/* copy_*_user */

#include "scull.h"		/* local definitions */
#include "access_ok_version.h"

/*
 * Our parameters which can be set at load time.
 */

static int scull_major =   SCULL_MAJOR;
static int scull_minor =   0;
static int scull_fifo_elemsz = SCULL_FIFO_ELEMSZ_DEFAULT; /* SIZE */
static int scull_fifo_size   = SCULL_FIFO_SIZE_DEFAULT; /* N */
//create a char array called scull_fifo
static char *scull_fifo;
//create two pointers to manage scull_fifo to manage scull_fifo as a circular buffer
static char *scull_fifo_start = NULL;
static char *scull_fifo_end = NULL;
//create a mutex for scull_fifo
static struct mutex scull_mutex;
//create 2 semaphores, 1 for read, 1 for write
static struct semaphore scull_read_sem;
static struct semaphore scull_write_sem;



module_param(scull_major, int, S_IRUGO);
module_param(scull_minor, int, S_IRUGO);
module_param(scull_fifo_size, int, S_IRUGO);
module_param(scull_fifo_elemsz, int, S_IRUGO);

MODULE_AUTHOR("Christian Bautista 10450958");
MODULE_LICENSE("Dual BSD/GPL");

static struct cdev scull_cdev;		/* Char device structure		*/


/*
 * Open and close
 */

static int scull_open(struct inode *inode, struct file *filp)
{
	printk(KERN_INFO "scull open\n");
	return 0;          /* success */
}

static int scull_release(struct inode *inode, struct file *filp)
{
	printk(KERN_INFO "scull close\n");
	return 0;          /* success */
}

/*
 * Read and Write
 */
static ssize_t scull_read(struct file *filp, char __user *buf, size_t count, loff_t *f_pos)
{
	// int *lp = NULL;
	// int len = 0;

	//acquire the read semaphore, else sleep until it is available
	if(down_interruptible(&scull_read_sem)) {
		return -ERESTARTSYS;
	}
	//printk(KERN_ALERT "read acquired");
	//acquire the mutex, else sleep until it is available
	if(mutex_lock_interruptible(&scull_mutex)) {
		return -ERESTARTSYS;
	}
	//printk(KERN_ALERT "mutex acquired");
	//printk(KERN_INFO "scull read\n"); //may omit this line
	//if start is equal to end, release write semaphore
	if(scull_fifo_start == scull_fifo_end)
	{
		up(&scull_write_sem);
	}
	//get the len of the next element
	// lp = scull_fifo_start;
	// len = *lp;
	// printk(KERN_ALERT "len: %d", len);
	//if count is bigger than the size of the next element, copy only len bytes into buf
	if(count>*scull_fifo_start) {
		count = *scull_fifo_start;
	}
	//increment start by len
	scull_fifo_start += (sizeof(int)/sizeof(char));
	//copy the bytes of the next element into buf, return an error if copying fails
	if(access_ok(VERIFY_WRITE, buf, count)) {
		if(copy_to_user(buf, scull_fifo_start, count)) {
			return -EFAULT;
		}
	}
	//increment start by elemsz
	//MAY CHANGE THIS DEPENDING ON CLARIFICATION
	scull_fifo_start += scull_fifo_elemsz;
	//if the end of the array is reached, reset the start of the array to the beginning
	if(scull_fifo_start==(scull_fifo+(scull_fifo_size*(sizeof(int)+scull_fifo_elemsz)))) {
		scull_fifo_start = scull_fifo;
	}
	//if start is not equal to end, release read semaphore
	if(scull_fifo_start != scull_fifo_end) {
		up(&scull_read_sem);
		//printk(KERN_ALERT "read released");
	} /*else {
		//printk(KERN_ALERT "read not released");
	}*/
	//release mutex
	mutex_unlock(&scull_mutex);
	//printk(KERN_ALERT "mutex released");
	//return the number of bytes copied as result, which cannot be bigger than the size of the next full element
	return count;
}


static ssize_t scull_write(struct file *filp, const char __user *buf, size_t count, loff_t *f_pos)
{
	//int *lp = NULL;
	int len = 0;

	//acquire the write semaphore, else sleep until it is available
	if(down_interruptible(&scull_write_sem)) {
		return -ERESTARTSYS;
	}
	//printk(KERN_ALERT "write acquired");
	//acquire the mutex, else sleep until it is available
	if(mutex_lock_interruptible(&scull_mutex)) {
		return -ERESTARTSYS;
	}
	//printk(KERN_ALERT "mutex acquired");
	//printk(KERN_INFO "scull write\n"); //may omit this line
	//if start is equal to end, release read semaphore
	if(scull_fifo_start == scull_fifo_end)
	{
		up(&scull_read_sem);
	}
	//if count is larger than elemsz, then only elemsz bytes are copied, otherwise count bytes are copied
	if(count>scull_fifo_elemsz) {
		count = scull_fifo_elemsz;
	}
	//set len to count
	len = (int)count;
	//memset len to end
	memset(scull_fifo_end, len, sizeof(int));
	/*
	//copy len into scull_fifo_end
	if(access_ok(VERIFY_WRITE, buf, sizeof(int))) {
		if(copy_from_user(scull_fifo_end, len, sizeof(int))) {
			return -EFAULT;
		}
	}
	*/
	//increment end by sizeof(int)/sizeof(char)
	scull_fifo_end += (sizeof(int)/sizeof(char));
	//copy count bytes from buf into scull_fifo_end
	if(access_ok(VERIFY_WRITE, buf, count)) {
		if(copy_from_user(scull_fifo_end, buf, count)) {
			return -EFAULT;
		}
	}
	//increment end by elemsz
	//MAY CHANGE THIS DEPENDING ON CLARIFICATION
	scull_fifo_end += scull_fifo_elemsz;
	//if the end of the array is reached, reset the end of the array to the beginning
	if(scull_fifo_end==(scull_fifo+(scull_fifo_size*(sizeof(int)+scull_fifo_elemsz)))) {
		scull_fifo_end = scull_fifo;
	}
	//if end is not equal to start, release write semaphore
	if(scull_fifo_end != scull_fifo_start)
	{
		up(&scull_write_sem);
		//printk(KERN_ALERT "write released");
	} /*else {
		//printk(KERN_ALERT "write not released");
	}*/
	//release mutex
	mutex_unlock(&scull_mutex);
	//printk(KERN_ALERT "mutex released");
	//return the number of bytes copied as result, which cannot be bigger than the size of the next full element
	return count;
}

/*
 * The ioctl() implementation
 */

static long scull_ioctl(struct file *filp, unsigned int cmd,
		unsigned long arg)
{

	int err = 0;
	int retval = 0;
    
	/*
	 * extract the type and number bitfields, and don't decode
	 * wrong cmds: return ENOTTY (inappropriate ioctl) before access_ok()
	 */
	if (_IOC_TYPE(cmd) != SCULL_IOC_MAGIC) return -ENOTTY;
	if (_IOC_NR(cmd) > SCULL_IOC_MAXNR) return -ENOTTY;

	/*
	 * the direction is a bitmask, and VERIFY_WRITE catches R/W
	 * transfers. `Type' is user-oriented, while
	 * access_ok is kernel-oriented, so the concept of "read" and
	 * "write" is reversed
	 */
	if (_IOC_DIR(cmd) & _IOC_READ)
		err = !access_ok_wrapper(VERIFY_WRITE, (void __user *)arg,
				_IOC_SIZE(cmd));
	else if (_IOC_DIR(cmd) & _IOC_WRITE)
		err =  !access_ok_wrapper(VERIFY_READ, (void __user *)arg,
				_IOC_SIZE(cmd));
	if (err) return -EFAULT;

	switch(cmd) {
	case SCULL_IOCGETELEMSZ:
		return scull_fifo_elemsz;

	default:  /* redundant, as cmd was checked against MAXNR */
		return -ENOTTY;
	}
	return retval;

}


struct file_operations scull_fops = {
	.owner 		= THIS_MODULE,
	.unlocked_ioctl = scull_ioctl,
	.open 		= scull_open,
	.release	= scull_release,
	.read 		= scull_read,
	.write 		= scull_write,
};

/*
 * Finally, the module stuff
 */

/*
 * The cleanup function is used to handle initialization failures as well.
 * Thefore, it must be careful to work correctly even if some of the items
 * have not been initialized
 */
void scull_cleanup_module(void)
{
	dev_t devno = MKDEV(scull_major, scull_minor);

	/* Free FIFO safely */
	//free memory allocated for scull_fifo
	kfree(scull_fifo);
	//check if memory was freed
	if(scull_fifo == NULL)
	{
		printk(KERN_ERR "scull: could not free memory\n");
		return -ENOMEM;
	}

	/* Get rid of the char dev entry */
	cdev_del(&scull_cdev);

	/* cleanup_module is never called if registering failed */
	unregister_chrdev_region(devno, 1);
}


int scull_init_module(void)
{
	int result;
	dev_t dev = 0;

	/*
	 * Get a range of minor numbers to work with, asking for a dynamic
	 * major unless directed otherwise at load time.
	 */
	if (scull_major) {
		dev = MKDEV(scull_major, scull_minor);
		result = register_chrdev_region(dev, 1, "scull");
	} else {
		result = alloc_chrdev_region(&dev, scull_minor, 1, "scull");
		scull_major = MAJOR(dev);
	}
	if (result < 0) {
		printk(KERN_WARNING "scull: can't get major %d\n", scull_major);
		return result;
	}

	cdev_init(&scull_cdev, &scull_fops);
	scull_cdev.owner = THIS_MODULE;
	result = cdev_add (&scull_cdev, dev, 1);
	/* Fail gracefully if need be */
	if (result) {
		printk(KERN_NOTICE "Error %d adding scull character device", result);
		goto fail;
	}

	/* Allocate FIFO correctly */

	//allocate memory for scull_fifo
	scull_fifo = kmalloc(scull_fifo_size*(sizeof(int)+scull_fifo_elemsz), GFP_KERNEL);
	//check if memory was allocated
	if(scull_fifo == NULL)
	{
		printk(KERN_ERR "scull: could not allocate memory\n");
		return -ENOMEM;
	}
	//initialize start and end
	scull_fifo_start = scull_fifo;
	scull_fifo_end = scull_fifo;
	//initialize mutex
	mutex_init(&scull_mutex);
	//initialize semaphores
	sema_init(&scull_read_sem, 0);
	sema_init(&scull_write_sem, 1);

	printk(KERN_INFO "scull: FIFO SIZE=%u, ELEMSZ=%u\n", scull_fifo_size, 
			scull_fifo_elemsz);

	return 0; /* succeed */

  fail:
	scull_cleanup_module();
	return result;
}

module_init(scull_init_module);
module_exit(scull_cleanup_module);
