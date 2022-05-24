'''
Name: Christian Bautista
Assignment 7
Description: Take the 2019 Pew Survey results and perform and display the results of demographical analysis.
Purpose:
The general and accepted notion in society is that the younger generations tend to be more prevalent on social media than the older ones. 
Through this survey, I look to determine the truth of this claim and take it a step further by seeing which social media applications, 
if any, are dominated by a particular generation. I feel this analysis is important in the sense that it can potentially help to 
remove the stigma that older people are not adept on social media. In the same way, it can also help to remove the stigma that
not only younger people use social media. 
'''

import csv
from tabulate import tabulate
import matplotlib.pyplot as plt

SMU = 2 # Social Media Use
T = 4 # Twitter
I = 5 # Instagram
F = 6 # Facebook
S = 7 # Snapchat
Y = 8 # YouTube
W = 9 # WhatsApp
P = 10 # Pinterest
L = 11 # LinkedIn
R = 12 # Reddit
TF = 13 # Twitter Frequency
IF = 14 # Instagram Frequency
FF = 15 # Facebook Frequency
SF = 16 # Snapchat Frequency
YF = 17 # Youtube Frequency
AGE = 23 # Age

def smu(decision):
    if decision==1:
        return 0
    elif decision==2:
        return 1
    else:
        return 2

def freq(decision):
    if decision==1:
        return 0
    elif decision==2:
        return 1
    elif decision==3:
        return 2
    elif decision==4:
        return 3
    elif decision==5:
        return 4
    else:
        return 5



def main():
    f = open("Pew_Survey.csv")
    reader = csv.reader(f)
    '''
    data = []
    for row in reader:
        data.append(row)
    f.close()
    '''
    # set up graphs here
    # 1
    SMUG_labels = ["Greatest", "Silent", "Boomers", "Gen X", "Millenials", "Gen Z"]
    SMUG_data = [0,0,0,0,0,0]
    # Greatest
    GSMU_labels = ["Use", "Don't Use", "Unknown"]
    GSMU_data = [0,0,0]
    # Silent
    SSMU_labels = ["Use", "Don't Use", "Unknown"]
    SSMU_data = [0,0,0]
    # Boomers
    BSMU_labels = ["Use", "Don't Use", "Unknown"]
    BSMU_data = [0,0,0]
    # Gen X
    XSMU_labels = ["Use", "Don't Use", "Unknown"]
    XSMU_data = [0,0,0]
    # Millenials
    MSMU_labels = ["Use", "Don't Use", "Unknown"]
    MSMU_data = [0,0,0]
    # Gen Z
    ZSMU_labels = ["Use", "Don't Use", "Unknown"]
    ZSMU_data = [0,0,0]
    # 2
    # Twitter
    TUG_labels = ["Greatest", "Silent", "Boomers", "Gen X", "Millenials", "Gen Z"]
    TUG_data = [0,0,0,0,0,0]
    # Instagram
    IUG_labels = ["Greatest", "Silent", "Boomers", "Gen X", "Millenials", "Gen Z"]
    IUG_data = [0,0,0,0,0,0]
    # Facebook
    FUG_labels = ["Greatest", "Silent", "Boomers", "Gen X", "Millenials", "Gen Z"]
    FUG_data = [0,0,0,0,0,0]
    # Snapchat
    SUG_labels = ["Greatest", "Silent", "Boomers", "Gen X", "Millenials", "Gen Z"]
    SUG_data = [0,0,0,0,0,0]
    # YouTube
    YUG_labels = ["Greatest", "Silent", "Boomers", "Gen X", "Millenials", "Gen Z"]
    YUG_data = [0,0,0,0,0,0]
    # WhatsApp
    WUG_labels = ["Greatest", "Silent", "Boomers", "Gen X", "Millenials", "Gen Z"]
    WUG_data = [0,0,0,0,0,0]
    # Pinterest
    PUG_labels = ["Greatest", "Silent", "Boomers", "Gen X", "Millenials", "Gen Z"]
    PUG_data = [0,0,0,0,0,0]
    # LinkedIn
    LUG_labels = ["Greatest", "Silent", "Boomers", "Gen X", "Millenials", "Gen Z"]
    LUG_data = [0,0,0,0,0,0]
    # Reddit
    RUG_labels = ["Greatest", "Silent", "Boomers", "Gen X", "Millenials", "Gen Z"]
    RUG_data = [0,0,0,0,0,0]
    # 3
    # Twitter
    TFG_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    TFG_data = [0,0,0,0,0,0]
    TFS_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    TFS_data = [0,0,0,0,0,0]
    TFB_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    TFB_data = [0,0,0,0,0,0]
    TFX_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    TFX_data = [0,0,0,0,0,0]
    TFM_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    TFM_data = [0,0,0,0,0,0]
    TFZ_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    TFZ_data = [0,0,0,0,0,0]
    # Instagram
    IFG_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    IFG_data = [0,0,0,0,0,0]
    IFS_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    IFS_data = [0,0,0,0,0,0]
    IFB_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    IFB_data = [0,0,0,0,0,0]
    IFX_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    IFX_data = [0,0,0,0,0,0]
    IFM_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    IFM_data = [0,0,0,0,0,0]
    IFZ_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    IFZ_data = [0,0,0,0,0,0]
    # Facebook
    FFG_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    FFG_data = [0,0,0,0,0,0]
    FFS_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    FFS_data = [0,0,0,0,0,0]
    FFB_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    FFB_data = [0,0,0,0,0,0]
    FFX_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    FFX_data = [0,0,0,0,0,0]
    FFM_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    FFM_data = [0,0,0,0,0,0]
    FFZ_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    FFZ_data = [0,0,0,0,0,0]
    # Snapchat
    SFG_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    SFG_data = [0,0,0,0,0,0]
    SFS_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    SFS_data = [0,0,0,0,0,0]
    SFB_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    SFB_data = [0,0,0,0,0,0]
    SFX_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    SFX_data = [0,0,0,0,0,0]
    SFM_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    SFM_data = [0,0,0,0,0,0]
    SFZ_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    SFZ_data = [0,0,0,0,0,0]
    # YouTube
    YFG_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    YFG_data = [0,0,0,0,0,0]
    YFS_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    YFS_data = [0,0,0,0,0,0]
    YFB_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    YFB_data = [0,0,0,0,0,0]
    YFX_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    YFX_data = [0,0,0,0,0,0]
    YFM_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    YFM_data = [0,0,0,0,0,0]
    YFZ_labels = ["Several Times a Day", "About Once a Day", "Few Times a Week", "Every Few Weeks", "Less Often", "Other"]
    YFZ_data = [0,0,0,0,0,0]

    # skip the first row as it's just headers
    initial = True
    # for each row in reader
    for row in reader:
        if initial:
            initial = False
            continue

        # 1. Social Media Usage by Generation (SMUG): Percent of people that use social media for each generation
        # 2. Percent of users for each generation that use each individual social media
        # 3. Frequency of users for each demographic for each social media
        # determine generation
        gen = 0 # {0: "Greatest", 1: "Silent", 2: "Boomers", 3: "Gen X", 4: "Millenials", 5: "Gen Z"}
        dec = smu(int(row[SMU])) # whether they use social media or not
        # for each generation, increment the appropriate social media usage data based on decision
        age = int(row[AGE])
        if age>91: # Greatest
            gen = 0
            GSMU_data[dec]+=1
        elif age>73: # Silent
            gen = 1
            SSMU_data[dec]+=1
        elif age>54: # Boomers
            gen = 2
            BSMU_data[dec]+=1
        elif age>38: # Gen X
            gen = 3
            XSMU_data[dec]+=1
        elif age>22: # Millenials
            gen = 4
            MSMU_data[dec]+=1
        else: # Gen Z
            gen = 5
            ZSMU_data[dec]+=1
        # if they use social media, increment the generation data field in the social media usage data
        if dec==0:
            SMUG_data[gen]+=1
        # for each social media, increment the generation data if they use it
        # for Twitter, Instagram, Facebook, Snapchat, and YouTube, increment the generational frequency data
        if len(row[T].strip())>0 and int(row[T]): # Twitter
            TUG_data[gen]+=1
            if len(row[TF].strip())>0:
                dec = freq(int(row[TF]))
                if(gen==0):
                    TFG_data[dec]+=1
                elif(gen==1):
                    TFS_data[dec]+=1
                elif(gen==2):
                    TFB_data[dec]+=1
                elif(gen==3):
                    TFX_data[dec]+=1
                elif(gen==4):
                    TFM_data[dec]+=1
                elif(gen==5):
                    TFZ_data[dec]+=1
        if len(row[I].strip())>0 and int(row[I]): # Instagram
            IUG_data[gen]+=1
            if len(row[IF].strip())>0:
                dec = freq(int(row[IF]))
                if(gen==0):
                    IFG_data[dec]+=1
                elif(gen==1):
                    IFS_data[dec]+=1
                elif(gen==2):
                    IFB_data[dec]+=1
                elif(gen==3):
                    IFX_data[dec]+=1
                elif(gen==4):
                    IFM_data[dec]+=1
                elif(gen==5):
                    IFZ_data[dec]+=1
        if len(row[F].strip())>0 and int(row[F]): # Facebook
            FUG_data[gen]+=1
            if len(row[FF].strip())>0:
                dec = freq(int(row[FF]))
                if(gen==0):
                    FFG_data[dec]+=1
                elif(gen==1):
                    FFS_data[dec]+=1
                elif(gen==2):
                    FFB_data[dec]+=1
                elif(gen==3):
                    FFX_data[dec]+=1
                elif(gen==4):
                    FFM_data[dec]+=1
                elif(gen==5):
                    FFZ_data[dec]+=1
        if len(row[S].strip())>0 and int(row[S]): # Snapchat
            SUG_data[gen]+=1
            if len(row[SF].strip())>0:
                dec = freq(int(row[SF]))
                if(gen==0):
                    SFG_data[dec]+=1
                elif(gen==1):
                    SFS_data[dec]+=1
                elif(gen==2):
                    SFB_data[dec]+=1
                elif(gen==3):
                    SFX_data[dec]+=1
                elif(gen==4):
                    SFM_data[dec]+=1
                elif(gen==5):
                    SFZ_data[dec]+=1
        if len(row[Y].strip())>0 and int(row[Y]): # YouTube
            YUG_data[gen]+=1
            if len(row[YF].strip())>0:
                dec = freq(int(row[YF]))
                if(gen==0):
                    YFG_data[dec]+=1
                elif(gen==1):
                    YFS_data[dec]+=1
                elif(gen==2):
                    YFB_data[dec]+=1
                elif(gen==3):
                    YFX_data[dec]+=1
                elif(gen==4):
                    YFM_data[dec]+=1
                elif(gen==5):
                    YFZ_data[dec]+=1
        if len(row[W].strip())>0 and int(row[W]): # WhatsApp
            WUG_data[gen]+=1
        if len(row[P].strip())>0 and int(row[P]): # Pinterest
            PUG_data[gen]+=1
        if len(row[L].strip())>0 and int(row[L]): # LinkedIn
            LUG_data[gen]+=1
        if len(row[R].strip())>0 and int(row[R]): # Reddit
            RUG_data[gen]+=1       
    
    f.close()
    # print all data using tabulate and pie charts
    print("Social Media Usage by Generation")
    print(tabulate([SMUG_data],headers=SMUG_labels,tablefmt="grid"))
    print("\nGreatest Generation")
    print(tabulate([GSMU_data],headers=GSMU_labels,tablefmt="grid"))
    print("\nSilent Generation")
    print(tabulate([SSMU_data],headers=SSMU_labels,tablefmt="grid"))
    print("\nBaby Boomers")
    print(tabulate([BSMU_data],headers=BSMU_labels,tablefmt="grid"))
    print("\nGeneration X")
    print(tabulate([XSMU_data],headers=XSMU_labels,tablefmt="grid"))
    print("\nMillenials")
    print(tabulate([MSMU_data],headers=MSMU_labels,tablefmt="grid"))
    print("\nGeneration Z")
    print(tabulate([ZSMU_data],headers=ZSMU_labels,tablefmt="grid"))
    print("\nGenerational Demographic Depiction by Individual Social Media")
    print("\nTwitter")
    print(tabulate([TUG_data],headers=TUG_labels,tablefmt="grid"))
    print("\nInstagram")
    print(tabulate([IUG_data],headers=IUG_labels,tablefmt="grid"))
    print("\nFacebook")
    print(tabulate([FUG_data],headers=FUG_labels,tablefmt="grid"))
    print("\nSnapchat")
    print(tabulate([SUG_data],headers=SUG_labels,tablefmt="grid"))
    print("\nYouTube")
    print(tabulate([YUG_data],headers=YUG_labels,tablefmt="grid"))
    print("\nWhatsApp")
    print(tabulate([WUG_data],headers=WUG_labels,tablefmt="grid"))
    print("\nPinterest")
    print(tabulate([PUG_data],headers=PUG_labels,tablefmt="grid"))
    print("\nLinkedIn")
    print(tabulate([LUG_data],headers=LUG_labels,tablefmt="grid"))
    print("\nReddit")
    print(tabulate([RUG_data],headers=RUG_labels,tablefmt="grid"))
    print("\nSocial Media Usage Frequency by Generation")
    print("\nTwitter")
    print("\nGreatest Generation")
    print(tabulate([TFG_data],headers=TFG_labels,tablefmt="grid"))
    print("\nSilent Generation")
    print(tabulate([TFS_data],headers=TFS_labels,tablefmt="grid"))
    print("\nBaby Boomers")
    print(tabulate([TFB_data],headers=TFB_labels,tablefmt="grid"))
    print("\nGeneration X")
    print(tabulate([TFX_data],headers=TFX_labels,tablefmt="grid"))
    print("\nMillenials")
    print(tabulate([TFM_data],headers=TFM_labels,tablefmt="grid"))
    print("\nGeneration Z")
    print(tabulate([TFZ_data],headers=TFZ_labels,tablefmt="grid"))
    print("\nInstagram")
    print("\nGreatest Generation")
    print(tabulate([IFG_data],headers=IFG_labels,tablefmt="grid"))
    print("\nSilent Generation")
    print(tabulate([IFS_data],headers=IFS_labels,tablefmt="grid"))
    print("\nBaby Boomers")
    print(tabulate([IFB_data],headers=IFB_labels,tablefmt="grid"))
    print("\nGeneration X")
    print(tabulate([IFX_data],headers=IFX_labels,tablefmt="grid"))
    print("\nMillenials")
    print(tabulate([IFM_data],headers=IFM_labels,tablefmt="grid"))
    print("\nGeneration Z")
    print(tabulate([IFZ_data],headers=IFZ_labels,tablefmt="grid"))
    print("\nFacebook")
    print("\nGreatest Generation")
    print(tabulate([FFG_data],headers=FFG_labels,tablefmt="grid"))
    print("\nSilent Generation")
    print(tabulate([FFS_data],headers=FFS_labels,tablefmt="grid"))
    print("\nBaby Boomers")
    print(tabulate([FFB_data],headers=FFB_labels,tablefmt="grid"))
    print("\nGeneration X")
    print(tabulate([FFX_data],headers=FFX_labels,tablefmt="grid"))
    print("\nMillenials")
    print(tabulate([FFM_data],headers=FFM_labels,tablefmt="grid"))
    print("\nGeneration Z")
    print(tabulate([FFZ_data],headers=FFZ_labels,tablefmt="grid"))
    print("\nSnapchat")
    print("\nGreatest Generation")
    print(tabulate([SFG_data],headers=SFG_labels,tablefmt="grid"))
    print("\nSilent Generation")
    print(tabulate([SFS_data],headers=SFS_labels,tablefmt="grid"))
    print("\nBaby Boomers")
    print(tabulate([SFB_data],headers=SFB_labels,tablefmt="grid"))
    print("\nGeneration X")
    print(tabulate([SFX_data],headers=SFX_labels,tablefmt="grid"))
    print("\nMillenials")
    print(tabulate([SFM_data],headers=SFM_labels,tablefmt="grid"))
    print("\nGeneration Z")
    print(tabulate([SFZ_data],headers=SFZ_labels,tablefmt="grid"))
    print("\nYouTube")
    print("\nGreatest Generation")
    print(tabulate([YFG_data],headers=YFG_labels,tablefmt="grid"))
    print("\nSilent Generation")
    print(tabulate([YFS_data],headers=YFS_labels,tablefmt="grid"))
    print("\nBaby Boomers")
    print(tabulate([YFB_data],headers=YFB_labels,tablefmt="grid"))
    print("\nGeneration X")
    print(tabulate([YFX_data],headers=YFX_labels,tablefmt="grid"))
    print("\nMillenials")
    print(tabulate([YFM_data],headers=YFM_labels,tablefmt="grid"))
    print("\nGeneration Z")
    print(tabulate([YFZ_data],headers=YFZ_labels,tablefmt="grid")) 

main()