Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA08012D7D3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Dec 2019 11:14:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1imEY1-00028K-KR; Tue, 31 Dec 2019 10:14:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1imEY0-00028D-AF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Dec 2019 10:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tTROe88XgMM+AL0+D38O6ddErDpNKyKgcbgljO6wOlY=; b=cJVavqqJeBn7RqLSqlSLb6Miaa
 ta4yOjY7xreEW7DVraF0dm7Ydl4kWHknta++oH+xyesfapqR87CfxeHLtt1DmJl+52MGuDfAuoW4s
 qd0qRfp9pLnm4tJ2lCFu5kjWbEtEwlP36/r7ER+Xw4Yhwo/0mANL702sHYYoUg+gvE90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tTROe88XgMM+AL0+D38O6ddErDpNKyKgcbgljO6wOlY=; b=F1os64PKASO47ML4+NzQKCm7p4
 LD5w/qOZgSZKIP4rpfAT0mHBqKclU7GvwjSzttYntrcVS0ZHugOulEQzj+aSsEUrDClg2gR0iL/U0
 FfhVHHOoYbvh4XCF6Y5o+E+06hnAJPKuFEhcNibGlNxPkn0eMnJFq+ZDK8kJbOnhdzrg=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1imEXs-0036NS-D9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Dec 2019 10:14:44 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EB503C36F8734C5D31A3;
 Tue, 31 Dec 2019 18:14:26 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 31 Dec
 2019 18:14:25 +0800
To: Stephanos Mallouris <stephanos.mallouris@gmail.com>
References: <CAPfgDnCxNrZ-ZfEVoDG_ET8bjRNi3KaSPsjRE_ZrMm-yLbr4Cw@mail.gmail.com>
 <20191125174048.GA71634@jaegeuk-macbookpro.roam.corp.google.com>
 <CAPfgDnBLZUbx1pWZqTz09WmTcaS6gkE7sqLSXYSs_cJmWZ2PFg@mail.gmail.com>
 <20191126183448.GB5510@jaegeuk-macbookpro.roam.corp.google.com>
 <CAPfgDnDP8WCxL0s_2ct5egby1c-84rs9TmveHjb2TQ_1aW-4Uw@mail.gmail.com>
 <20191127182615.GB42245@jaegeuk-macbookpro.roam.corp.google.com>
 <CAPfgDnA28pAE=1y=6XtzmrhZ1WE8y-dScZv0dB6ymbkGbfzK=Q@mail.gmail.com>
 <20191203174302.GB41093@jaegeuk-macbookpro.roam.corp.google.com>
 <7bda6647-f4d6-216a-c771-a9023362e16b@huawei.com>
 <CAPfgDnB6tRvKou_19gS7M0eqeL87WsW1f+vTKkkMnPxVnA4j4w@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <86e80c6f-0470-6b58-696e-3b43c76f9852@huawei.com>
Date: Tue, 31 Dec 2019 18:14:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAPfgDnB6tRvKou_19gS7M0eqeL87WsW1f+vTKkkMnPxVnA4j4w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1imEXs-0036NS-D9
Subject: Re: [f2fs-dev] problem with f2fs android partition
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Sorry for the delay.

I figure out a patch to handle your case, w/ this patch, fsck will try to search
root inode and once it finds the target, it will relink it to its nat entry,
after this, all following check in fsck could be executed later.

If you still keep that corrupted image, could you please have a try w/ this patch?

[PATCH] fsck.f2fs: lookup and relink root inode

Thanks,

On 2019/12/17 18:11, Stephanos Mallouris wrote:
> Hi to all,
> 
> Sorry for the late reply. running the commands as suggested gave the following:
> 
> 1. # dump.f2fs -i 0x3 /dev/sdc3
> 
> Info: sector size = 512
> Info: total sectors = 25624576 (12512 MB)
> Info: MKFS version
>   "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
> 19 17:16:04 PKT 2018"
> Info: FSCK version
>   from "Linux version 4.1.46-EliteKernelReborn-v6+
> (hassanmirza01@ubuntu) (gcc version 4.9 20150123 (prerelease) (GCC) )
> #1 SMP PREEMPT Sat Jan 27 00:46:02 PKT 2018"
>     to "Linux version 4.4.0-170-generic (buildd@lgw01-amd64-015) (gcc
> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #199-Ubuntu
> SMP Thu Nov 14 01:44:41 UTC 2019"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 22310912 (10894 MB)
> Info: CKPT version = 1307e4
> Info: checkpoint state = 4 :  compacted_summary sudden-power-off
> Invalid node block
> 
> 
> Done.
> 
> 2.  # dump.f2fs -i 0x4 /dev/sdc3
> 
> Info: sector size = 512
> Info: total sectors = 25624576 (12512 MB)
> Info: MKFS version
>   "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
> 19 17:16:04 PKT 2018"
> Info: FSCK version
>   from "Linux version 4.4.0-170-generic (buildd@lgw01-amd64-015) (gcc
> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #199-Ubuntu
> SMP Thu Nov 14 01:44:41 UTC 2019"
>     to "Linux version 4.4.0-170-generic (buildd@lgw01-amd64-015) (gcc
> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #199-Ubuntu
> SMP Thu Nov 14 01:44:41 UTC 2019"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 22310912 (10894 MB)
> Info: CKPT version = 1307e4
> Info: checkpoint state = 4 :  compacted_summary sudden-power-off
> [print_node_info: 103] Node ID [0x4:4] is inode
> i_mode                        		[0x    41f8 : 16888]
> i_advise                      		[0x       2 : 2]
> i_uid                         		[0x     3ff : 1023]
> i_gid                         		[0x     3ff : 1023]
> i_links                       		[0x       5 : 5]
> i_size                        		[0x    1000 : 4096]
> i_blocks                      		[0x       3 : 3]
> i_atime                       		[0x5c52cc67 : 1548930151]
> i_atime_nsec                  		[0x380742f0 : 939999984]
> i_ctime                       		[0x5da861d5 : 1571316181]
> i_ctime_nsec                  		[0x232aaf7f : 589999999]
> i_mtime                       		[0x5ca8c4a0 : 1554564256]
> i_mtime_nsec                  		[0x bebc1fd : 199999997]
> i_generation                  		[0x414c2cfb : 1095511291]
> i_current_depth               		[0x       1 : 1]
> i_xattr_nid                   		[0x       5 : 5]
> i_flags                       		[0x       0 : 0]
> i_inline                      		[0x       0 : 0]
> i_pino                        		[0x       3 : 3]
> i_namelen                     		[0x       5 : 5]
> i_name                        		[media]
> i_ext: fofs:0 blkaddr:0 len:0
> i_addr[0]                     		[0x  294852 : 2705490]
> i_addr[1]                     		[0x       0 : 0]
> i_addr[2]                     		[0x       0 : 0]
> i_addr[3]                     		[0x       0 : 0]
> i_nid[0]                      		[0x       0 : 0]
> i_nid[1]                      		[0x       0 : 0]
> i_nid[2]                      		[0x       0 : 0]
> i_nid[3]                      		[0x       0 : 0]
> i_nid[4]                      		[0x       0 : 0]
> 
> Not a regular file
> 
> 
> Done.
> 
> 
> 
> 
> 3. dump.f2fs -i 0x5 /dev/sdc3
> 
> Info: sector size = 512
> Info: total sectors = 25624576 (12512 MB)
> Info: MKFS version
>   "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
> 19 17:16:04 PKT 2018"
> Info: FSCK version
>   from "Linux version 4.4.0-170-generic (buildd@lgw01-amd64-015) (gcc
> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #199-Ubuntu
> SMP Thu Nov 14 01:44:41 UTC 2019"
>     to "Linux version 4.4.0-170-generic (buildd@lgw01-amd64-015) (gcc
> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #199-Ubuntu
> SMP Thu Nov 14 01:44:41 UTC 2019"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 22310912 (10894 MB)
> Info: CKPT version = 1307e4
> Info: checkpoint state = 4 :  compacted_summary sudden-power-off
> [print_node_info: 109] Node ID [0x5:5] is direct node or indirect node.
> [0]			[0xf2f52011 : -218816495]
> [1]			[0x       1 : 1]
> [2]			[0x       0 : 0]
> [3]			[0x       0 : 0]
> [4]			[0x       0 : 0]
> [5]			[0x       0 : 0]
> [6]			[0x  210706 : 2164486]
> [7]			[0x696c6573 : 1768711539]
> [8]			[0x7578756e : 1970828654]
> [9]			[0x6a626f3a : 1784835898]
> [10]			[0x5f746365 : 1601463141]
> Not a regular file
> 
> 
> Done.
> 
> Those are the results. Hoping for your assistance and help
> 
> Regards
> 
> Stephanos M.
> 
> 
> 
> On 12/4/19, Chao Yu <yuchao0@huawei.com> wrote:
>> Hi Jaegeuk,
>>
>> On 2019/12/4 1:43, Jaegeuk Kim wrote:
>>> Hi,
>>>
>>> I think you didn't back up the root inode block, since it showed zeros.
>>> Could you try the below a bit on fresh back-up image again?
>>>
>>> # dump.f2fs -i 0x3 /dev/sdc1
>>> # dump.f2fs -i 0x4 /dev/sdc1
>>> # dump.f2fs -i 0x5 /dev/sdc1
>>
>> Quoted:
>> "[ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0"
>>
>> Look into log in the Stephanos' first report email, it looks like nat entry
>> of root inode was broken, if this is true, IMO, we have to add a routine to
>> detect such inconsistence and lookup last root inode and relink to its nat
>> entry.
>>
>> Thanks,
>>
>>>
>>> Thanks,
>>>
>>> On 11/28, Stephanos Mallouris wrote:
>>>> Hi,
>>>>
>>>> Thanks for the effort and advice .
>>>> Did execute the command. It gave a lot of information ,
>>>> so i am attaching that to a file.
>>>>
>>>> Regards
>>>>
>>>> Stephanos
>>>>
>>>>
>>>> On 11/27/19, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>>>>> Hi,
>>>>>
>>>>> On 11/27, Stephanos Mallouris wrote:
>>>>>> Dear Kim ,
>>>>>>
>>>>>> Regarding the question:
>>>>>>
>>>>>> "Hmm, # of valid blocks is 0, which is really impossible.
>>>>>>  Do you have original backed up image? I think at some point the image
>>>>>>  was overwritten when fsck.f2fs tried to fix.
>>>>>>  "
>>>>>>
>>>>>> I do have the original dump raw image. Please advice actions
>>>>>> to assist in recovering it.
>>>>>
>>>>> Could you share the first run with that image?
>>>>> # fsck.f2fs -d 3 "fresh backup image"
>>>>>
>>>>> Thanks,
>>>>>
>>>>>>
>>>>>> I did a dd to an external drive, and from where i tried unsuccessful
>>>>>> so
>>>>>> far.
>>>>>> I use the following command
>>>>>>
>>>>>> sudo dd if=mmcblk0p49.raw bs=512 oflag=sync status=progress
>>>>>> of=/dev/sda1
>>>>>>
>>>>>> mmcblk0p49.raw is the backup partitioned.
>>>>>>
>>>>>> Thanks in advance
>>>>>>
>>>>>> Stephanos M.
>>>>>>
>>>>>>
>>>>>> On 11/26/19, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>>>>>>> On 11/26, Stephanos Mallouris wrote:
>>>>>>>> Dear Kim,
>>>>>>>>
>>>>>>>> Thanks for getting back to me.
>>>>>>>>
>>>>>>>> I executed the command  fsck.f2fs -d 3 -f /dev/sdc1
>>>>>>>> and it gave me the following information:
>>>>>>>>
>>>>>>>> Info: Debug level = 3
>>>>>>>> Info: Force to fix corruption
>>>>>>>> Info: sector size = 512
>>>>>>>> Info: total sectors = 22310913 (10894 MB)
>>>>>>>> Info: MKFS version
>>>>>>>>   "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
>>>>>>>> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri
>>>>>>>> Jan
>>>>>>>> 19 17:16:04 PKT 2018"
>>>>>>>> Info: FSCK version
>>>>>>>>   from "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022)
>>>>>>>> (gcc
>>>>>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) )
>>>>>>>> #198-Ubuntu
>>>>>>>> SMP Tue Nov 12 10:34:23 UTC 2019"
>>>>>>>>     to "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022)
>>>>>>>> (gcc
>>>>>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) )
>>>>>>>> #198-Ubuntu
>>>>>>>> SMP Tue Nov 12 10:34:23 UTC 2019"
>>>>>>>> Info: superblock features = 0 :
>>>>>>>> Info: superblock encrypt level = 0, salt =
>>>>>>>> 00000000000000000000000000000000
>>>>>>>>
>>>>>>>> +--------------------------------------------------------+
>>>>>>>> | Super block                                            |
>>>>>>>> +--------------------------------------------------------+
>>>>>>>> magic                         		[0xf2f52010 : 4076150800]
>>>>>>>> major_ver                     		[0x       1 : 1]
>>>>>>>> volum_name                    		[]
>>>>>>>> minor_ver                     		[0x       7 : 7]
>>>>>>>> log_sectorsize                		[0x       9 : 9]
>>>>>>>> log_sectors_per_block         		[0x       3 : 3]
>>>>>>>> log_blocksize                 		[0x       c : 12]
>>>>>>>> log_blocks_per_seg            		[0x       9 : 9]
>>>>>>>> segs_per_sec                  		[0x       1 : 1]
>>>>>>>> secs_per_zone                 		[0x       1 : 1]
>>>>>>>> checksum_offset               		[0x       0 : 0]
>>>>>>>> block_count                   		[0x  2a8e00 : 2788864]
>>>>>>>> section_count                 		[0x    151f : 5407]
>>>>>>>> segment_count                 		[0x    1546 : 5446]
>>>>>>>> segment_count_ckpt            		[0x       2 : 2]
>>>>>>>> segment_count_sit             		[0x       2 : 2]
>>>>>>>> segment_count_nat             		[0x      18 : 24]
>>>>>>>> segment_count_ssa             		[0x       b : 11]
>>>>>>>> segment_count_main            		[0x    151f : 5407]
>>>>>>>> segment0_blkaddr              		[0x     200 : 512]
>>>>>>>> cp_blkaddr                    		[0x     200 : 512]
>>>>>>>> sit_blkaddr                   		[0x     600 : 1536]
>>>>>>>> nat_blkaddr                   		[0x     a00 : 2560]
>>>>>>>> ssa_blkaddr                   		[0x    3a00 : 14848]
>>>>>>>> main_blkaddr                  		[0x    5000 : 20480]
>>>>>>>> root_ino                      		[0x       3 : 3]
>>>>>>>> node_ino                      		[0x       1 : 1]
>>>>>>>> meta_ino                      		[0x       2 : 2]
>>>>>>>> cp_payload                    		[0x       0 : 0]
>>>>>>>> version                       Linux version 4.4.0-169-generic
>>>>>>>> (buildd@lgw01-amd64-022) (gcc version 5.4.0 20160609 (Ubuntu
>>>>>>>> 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu SMP Tue Nov 12 10:34:23 UTC
>>>>>>>> 2019
>>>>>>>> Info: total FS sectors = 22310912 (10894 MB)
>>>>>>>> Info: CKPT version = 1307e4
>>>>>>>>
>>>>>>>> +--------------------------------------------------------+
>>>>>>>> | Checkpoint                                             |
>>>>>>>> +--------------------------------------------------------+
>>>>>>>> checkpoint_ver                		[0x  1307e4 : 1247204]
>>>>>>>> user_block_count              		[0x  289400 : 2659328]
>>>>>>>> valid_block_count             		[0x       0 : 0]
>>>>>>>
>>>>>>> Hmm, # of valid blocks is 0, which is really impossible.
>>>>>>> Do you have original backed up image? I think at some point the image
>>>>>>> was overwritten when fsck.f2fs tried to fix.
>>>>>>>
>>>>>>>> rsvd_segment_count            		[0x      70 : 112]
>>>>>>>> overprov_segment_count        		[0x      d5 : 213]
>>>>>>>> free_segment_count            		[0x    1519 : 5401]
>>>>>>>> alloc_type[CURSEG_HOT_NODE]   		[0x       1 : 1]
>>>>>>>> alloc_type[CURSEG_WARM_NODE]  		[0x       1 : 1]
>>>>>>>> alloc_type[CURSEG_COLD_NODE]  		[0x       1 : 1]
>>>>>>>> cur_node_segno[0]             		[0x       3 : 3]
>>>>>>>> cur_node_segno[1]             		[0x       4 : 4]
>>>>>>>> cur_node_segno[2]             		[0x       5 : 5]
>>>>>>>> cur_node_blkoff[0]            		[0x       0 : 0]
>>>>>>>> cur_node_blkoff[1]            		[0x       0 : 0]
>>>>>>>> cur_node_blkoff[2]            		[0x       0 : 0]
>>>>>>>> alloc_type[CURSEG_HOT_DATA]   		[0x       1 : 1]
>>>>>>>> alloc_type[CURSEG_WARM_DATA]  		[0x       1 : 1]
>>>>>>>> alloc_type[CURSEG_COLD_DATA]  		[0x       1 : 1]
>>>>>>>> cur_data_segno[0]             		[0x       0 : 0]
>>>>>>>> cur_data_segno[1]             		[0x       1 : 1]
>>>>>>>> cur_data_segno[2]             		[0x       2 : 2]
>>>>>>>> cur_data_blkoff[0]            		[0x       0 : 0]
>>>>>>>> cur_data_blkoff[1]            		[0x       0 : 0]
>>>>>>>> cur_data_blkoff[2]            		[0x       0 : 0]
>>>>>>>> ckpt_flags                    		[0x       1 : 1]
>>>>>>>> cp_pack_total_block_count     		[0x       8 : 8]
>>>>>>>> cp_pack_start_sum             		[0x       1 : 1]
>>>>>>>> valid_node_count              		[0x       0 : 0]
>>>>>>>> valid_inode_count             		[0x       0 : 0]
>>>>>>>> next_free_nid                 		[0x   14105 : 82181]
>>>>>>>> sit_ver_bitmap_bytesize       		[0x      40 : 64]
>>>>>>>> nat_ver_bitmap_bytesize       		[0x     300 : 768]
>>>>>>>> checksum_offset               		[0x     ffc : 4092]
>>>>>>>> elapsed_time                  		[0x 167a468 : 23569512]
>>>>>>>> sit_nat_version_bitmap[0]     		[0x      79 : 121]
>>>>>>>>
>>>>>>>>
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x4bb2] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x6ba0] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x783c] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xa0ec] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xab88] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xadcd] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xb19c] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xb431] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xb8f4] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xbf40] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xce28] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xd299] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xd56c] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xd8d3] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xe527] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xe67d] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xf88c] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xfc96] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x10271] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x111d6] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x1154e] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x11b66] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x1271e] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x12abc] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x1339b] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x137d2] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x139ae] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x14363] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x146a2] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x151a3] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x151da] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x15580] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x15744] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x158eb] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x16030] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x1632b] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x16722] in nat cache
>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x16c38] in nat cache
>>>>>>>> [build_nat_area_bitmap:1718] valid nat entries (block_addr != 0x0)
>>>>>>>> [0x
>>>>>>>>       0 : 0]
>>>>>>>> [build_sit_area_bitmap:1214] Blocks [0x0 : 0] Free Segs [0x1519 :
>>>>>>>> 5401]
>>>>>>>>
>>>>>>>> Info: checkpoint state = 1 :  unmount
>>>>>>>> [ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0
>>>>>>>>
>>>>>>>> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
>>>>>>>> [FSCK] SIT valid block bitmap checking                [Ok..]
>>>>>>>> [FSCK] Hard link checking for regular file            [Ok..] [0x0]
>>>>>>>> [FSCK] valid_block_count matching with CP             [Ok..] [0x0]
>>>>>>>> [FSCK] valid_node_count matcing with CP (de lookup)   [Ok..] [0x0]
>>>>>>>> [FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0x0]
>>>>>>>> [FSCK] valid_inode_count matched with CP              [Ok..] [0x0]
>>>>>>>> [FSCK] free segment_count matched with CP             [Ok..]
>>>>>>>> [0x1519]
>>>>>>>> [FSCK] next block offset is free                      [Ok..]
>>>>>>>> [FSCK] fixing SIT types
>>>>>>>> [FSCK] other corrupted bugs                           [Fail]
>>>>>>>> [move_curseg_info:1471] Move curseg[0] 0 -> 0 after 5000
>>>>>>>> [move_curseg_info:1471] Move curseg[1] 1 -> 1 after 5000
>>>>>>>> [move_curseg_info:1471] Move curseg[2] 2 -> 2 after 5000
>>>>>>>> [move_curseg_info:1471] Move curseg[3] 3 -> 3 after 5000
>>>>>>>> [move_curseg_info:1471] Move curseg[4] 4 -> 4 after 5000
>>>>>>>> [move_curseg_info:1471] Move curseg[5] 5 -> 5 after 5000
>>>>>>>>
>>>>>>>> Done.
>>>>>>>>
>>>>>>>>
>>>>>>>> It still give the same error trying to mount the partiotion.
>>>>>>>> [57765.609319] F2FS-fs (sdc1): Failed to read root inode
>>>>>>>> [57765.651048] F2FS-fs (sdc1): Failed to read root inode
>>>>>>>> [58015.507861] F2FS-fs (sdc1): Failed to read root inode
>>>>>>>> [58015.563422] F2FS-fs (sdc1): Failed to read root inode
>>>>>>>>
>>>>>>>> Please advice and assist if possible.
>>>>>>>>
>>>>>>>> Kindest Regards,
>>>>>>>>
>>>>>>>> Stephanos Mallouris
>>>>>>>>
>>>>>>>> On 11/25/19, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 11/22, Stephanos Mallouris wrote:
>>>>>>>>>> Dear all,
>>>>>>>>>>
>>>>>>>>>> I have backup my f2fs android partition via netcat and adb.
>>>>>>>>>> After loosing the original partition, tried to restore it on a
>>>>>>>>>> local
>>>>>>>>>> drive and access it via linux but i am encountering the following
>>>>>>>>>> issues:
>>>>>>>>>>
>>>>>>>>>> A. trying the command
>>>>>>>>>>
>>>>>>>>>>  sudo mount -t f2fs /dev/sdc1 /mnt
>>>>>>>>>>
>>>>>>>>>> gives the following error
>>>>>>>>>>
>>>>>>>>>>  F2FS-fs (sdc1): Failed to read root inode
>>>>>>>>>>
>>>>>>>>>> B1. Tried to fsck the file system , see bellow:
>>>>>>>>>>
>>>>>>>>>> sudo fsck.f2fs -a  /dev/sdc1
>>>>>>>>>>
>>>>>>>>>> result:
>>>>>>>>>>
>>>>>>>>>> Info: Fix the reported corruption.
>>>>>>>>>> Info: sector size = 512
>>>>>>>>>> Info: total sectors = 22310913 (10894 MB)
>>>>>>>>>> Info: MKFS version
>>>>>>>>>>   "Linux version 4.1.46-EliteKernelReborn-v5+
>>>>>>>>>> (hassanmirza01@ubuntu)
>>>>>>>>>> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri
>>>>>>>>>> Jan
>>>>>>>>>> 19 17:16:04 PKT 2018"
>>>>>>>>>> Info: FSCK version
>>>>>>>>>>   from "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022)
>>>>>>>>>> (gcc
>>>>>>>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) )
>>>>>>>>>> #198-Ubuntu
>>>>>>>>>> SMP Tue Nov 12 10:34:23 UTC 2019"
>>>>>>>>>>     to "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022)
>>>>>>>>>> (gcc
>>>>>>>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) )
>>>>>>>>>> #198-Ubuntu
>>>>>>>>>> SMP Tue Nov 12 10:34:23 UTC 2019"
>>>>>>>>>> Info: superblock features = 0 :
>>>>>>>>>> Info: superblock encrypt level = 0, salt =
>>>>>>>>>> 00000000000000000000000000000000
>>>>>>>>>> Info: total FS sectors = 22310912 (10894 MB)
>>>>>>>>>> Info: CKPT version = 1307e4
>>>>>>>>>> Info: No error was reported
>>>>>>>>>>
>>>>>>>>>> Still unable to mount the partiotion , gives the same error.
>>>>>>>>>>
>>>>>>>>>> B2. Tried
>>>>>>>>>> sudo fsck.f2fs -f  /dev/sdc1
>>>>>>>>>
>>>>>>>>> Could you try: fsck.f2fs -d 3 -f /dev/sdc1?
>>>>>>>>> It seems you didn't back up the entire partition which is missing
>>>>>>>>> root
>>>>>>>>> inode
>>>>>>>>> block.
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> result
>>>>>>>>>>
>>>>>>>>>> Info: Force to fix corruption
>>>>>>>>>> Info: sector size = 512
>>>>>>>>>> Info: total sectors = 22310913 (10894 MB)
>>>>>>>>>> Info: MKFS version
>>>>>>>>>>   "Linux version 4.1.46-EliteKernelReborn-v5+
>>>>>>>>>> (hassanmirza01@ubuntu)
>>>>>>>>>> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri
>>>>>>>>>> Jan
>>>>>>>>>> 19 17:16:04 PKT 2018"
>>>>>>>>>> Info: FSCK version
>>>>>>>>>>   from "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022)
>>>>>>>>>> (gcc
>>>>>>>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) )
>>>>>>>>>> #198-Ubuntu
>>>>>>>>>> SMP Tue Nov 12 10:34:23 UTC 2019"
>>>>>>>>>>     to "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022)
>>>>>>>>>> (gcc
>>>>>>>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) )
>>>>>>>>>> #198-Ubuntu
>>>>>>>>>> SMP Tue Nov 12 10:34:23 UTC 2019"
>>>>>>>>>> Info: superblock features = 0 :
>>>>>>>>>> Info: superblock encrypt level = 0, salt =
>>>>>>>>>> 00000000000000000000000000000000
>>>>>>>>>> Info: total FS sectors = 22310912 (10894 MB)
>>>>>>>>>> Info: CKPT version = 1307e4
>>>>>>>>>> Info: checkpoint state = 1 :  unmount
>>>>>>>>>> [ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0
>>>>>>>>>>
>>>>>>>>>> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
>>>>>>>>>> [FSCK] SIT valid block bitmap checking                [Ok..]
>>>>>>>>>> [FSCK] Hard link checking for regular file            [Ok..] [0x0]
>>>>>>>>>> [FSCK] valid_block_count matching with CP             [Ok..] [0x0]
>>>>>>>>>> [FSCK] valid_node_count matcing with CP (de lookup)   [Ok..] [0x0]
>>>>>>>>>> [FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0x0]
>>>>>>>>>> [FSCK] valid_inode_count matched with CP              [Ok..] [0x0]
>>>>>>>>>> [FSCK] free segment_count matched with CP             [Ok..]
>>>>>>>>>> [0x1519]
>>>>>>>>>> [FSCK] next block offset is free                      [Ok..]
>>>>>>>>>> [FSCK] fixing SIT types
>>>>>>>>>> [FSCK] other corrupted bugs                           [Fail]
>>>>>>>>>> [move_curseg_info:1471] Move curseg[0] 0 -> 0 after 5000
>>>>>>>>>> [move_curseg_info:1471] Move curseg[1] 1 -> 1 after 5000
>>>>>>>>>> [move_curseg_info:1471] Move curseg[2] 2 -> 2 after 5000
>>>>>>>>>> [move_curseg_info:1471] Move curseg[3] 3 -> 3 after 5000
>>>>>>>>>> [move_curseg_info:1471] Move curseg[4] 4 -> 4 after 5000
>>>>>>>>>> [move_curseg_info:1471] Move curseg[5] 5 -> 5 after 5000
>>>>>>>>>>
>>>>>>>>>> Done.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Trying to mount it , no success, gives
>>>>>>>>>>
>>>>>>>>>> F2FS-fs (sdc1): Failed to read root inode.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Any help or advice will be much appreciated.
>>>>>>>>>> Keep up the great work on f2fs.
>>>>>>>>>>
>>>>>>>>>> Kindest Regards
>>>>>>>>>>
>>>>>>>>>> Stephanos Mallouris
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> _______________________________________________
>>>>>>>>>> Linux-f2fs-devel mailing list
>>>>>>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>>>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>>>>>>
>>>>>>>
>>>>>
>>>
>>>
>>>
>>>
>>> _______________________________________________
>>> Linux-f2fs-devel mailing list
>>> Linux-f2fs-devel@lists.sourceforge.net
>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>> .
>>>
>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
