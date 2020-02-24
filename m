Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 340BC16A7C3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 14:59:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6EG9-0004cs-Bn; Mon, 24 Feb 2020 13:58:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <megi@xff.cz>) id 1j6EG6-0004cd-EJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 13:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fDp+EOb0J6ChoIbY9V75kt5izYuU6leLVl8Ck7iyuMg=; b=TENLF5paU6YGl3svFXaXUKo6aW
 qKJF5WwoLTc38Do/Wlq4gWxu6IJ6Fx+MQHeiGI3l2QZwXJTo5aBrKgK713cvhtXYjwCyvBU6HebZ2
 Tkjf9p7eRACNLJDD80XCy4GOvoGYwlNtssD/7miSMn1E2yUIlqmXjJZp+ph5ZwBeWSOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fDp+EOb0J6ChoIbY9V75kt5izYuU6leLVl8Ck7iyuMg=; b=NYWAdODaMwgavG+hKYZwGlzLOd
 5G/hJnA+PQ0vR5SiTs6CnFgvaLT0nyLHrDiXyG8xMw8nODgm9BK0w4uYt8lUT7OP/VT50gMaMDvru
 1zjt10MipP+DOjyC/alY2IS7t0NPTdE4eB9ZRljyJWb8J51/PCc7ZspIm7LZJpIVefEo=;
Received: from vps.xff.cz ([195.181.215.36])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6EG1-005C68-Dj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 13:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1582552718; bh=kNdq/tyuzz8J4IGLHUR3ZrBRto8+YSI1TyR6d8WW62s=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=Hu6CF2c0GbNTAngGCqnIknCN2QbF0FH7nicgqCXsHB2P1+GWwNaH0SAd8ftEXYaOd
 HI7yBYFPzkPtX8QB8OWQt+D4xMtJCQuy/4o83lYU5awiWsAfyQ0RbeQee0A2V5nWbM
 hGFT9NG9c7QzTNNEh40aCHHZW3XEPjdkBWZfFZ0g=
Date: Mon, 24 Feb 2020 14:58:37 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200224135837.k54ke4ppca26ibec@core.my.home>
Mail-Followup-To: Chao Yu <yuchao0@huawei.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191209222345.1078-1-jaegeuk@kernel.org>
 <20200222044617.pfrhnz2iavkrtdn6@core.my.home>
 <20200222181721.tzrrohep5l3yklpf@core.my.home>
 <bec3798b-f861-b132-9138-221027bb5195@huawei.com>
 <b1eb9b22-b570-41ab-5177-2c89105428a2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1eb9b22-b570-41ab-5177-2c89105428a2@huawei.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6EG1-005C68-Dj
Subject: Re: [f2fs-dev] Writes stoped working on f2fs after the compression
 support was added
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

On Mon, Feb 24, 2020 at 06:41:03PM +0800, Chao Yu wrote:
> On 2020/2/24 18:37, Chao Yu wrote:
> > Hi,
> > 
> > Thanks for the report.
> > 
> > Could you dump all other task stack info via "echo "t" > /proc/sysrq-trigger"?
> > 
> >>
> >> [  246.758021] INFO: task kworker/u16:1:58 blocked for more than 122 seconds.
> >> [  246.758040]       Not tainted 5.6.0-rc2-00590-g9983bdae4974e #11
> >> [  246.758044] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> >> [  246.758052] kworker/u16:1   D    0    58      2 0x00000000
> >> [  246.758090] Workqueue: writeback wb_workfn (flush-179:0)
> >> [  246.758099] Backtrace:
> >> [  246.758121] [<c0912b90>] (__schedule) from [<c0913234>] (schedule+0x78/0xf4)
> >> [  246.758130]  r10:da644000 r9:00000000 r8:da645a60 r7:da283e10 r6:00000002 r5:da644000
> >> [  246.758132]  r4:da4d3600
> >> [  246.758148] [<c09131bc>] (schedule) from [<c017ec74>] (rwsem_down_write_slowpath+0x24c/0x4c0)
> >> [  246.758152]  r5:00000001 r4:da283e00
> >> [  246.758161] [<c017ea28>] (rwsem_down_write_slowpath) from [<c0915f2c>] (down_write+0x6c/0x70)
> >> [  246.758167]  r10:da283e00 r9:da645d80 r8:d9ed0000 r7:00000001 r6:00000000 r5:eff213b0
> >> [  246.758169]  r4:da283e00
> >> [  246.758187] [<c0915ec0>] (down_write) from [<c0435b80>] (f2fs_write_single_data_page+0x608/0x7ac)
> > 
> > I'm not sure what is this semaphore, I suspect this is F2FS_I(inode)->i_sem, in order to make
> > sure of this, can you help to add below function, and use them to replace
> > all {down,up}_{write,read}(&.i_sem) invoking? then reproduce this issue and catch the log.
> 
> Sorry, just forgot attaching below function.
> 
> void inode_down_write(struct inode *inode)
> {
> 	printk("%s from %pS\n", __func__, __builtin_return_address(0));
> 	down_write(&F2FS_I(inode)->i_sem);
> }
> 
> void inode_up_write(struct inode *inode)
> {
> 	up_write(&F2FS_I(inode)->i_sem);
> 	printk("%s from %pS\n", __func__, __builtin_return_address(0));
> }
> 
> void inode_down_read(struct inode *inode)
> {
> 	printk("%s from %pS\n", __func__, __builtin_return_address(0));
> 	down_read(&F2FS_I(inode)->i_sem);
> }
> 
> void inode_up_read(struct inode *inode)
> {
> 	up_read(&F2FS_I(inode)->i_sem);
> 	printk("%s from %pS\n", __func__, __builtin_return_address(0));
> }
> 

Here's the log and vmlinux file that may help mapping the code addresses back to
code, hope it helps:

https://megous.com/dl/tmp/f2fs-dmesg-log
https://megous.com/dl/tmp/f2fs-log-build-artifacts.tar.gz

thank you,
	o.

> > Thanks,
> > 
> >> [  246.758190]  r5:eff213b0 r4:da283c60
> >> [  246.758198] [<c0435578>] (f2fs_write_single_data_page) from [<c0435fd8>] (f2fs_write_cache_pages+0x2b4/0x7c4)
> >> [  246.758204]  r10:da645c28 r9:da283d60 r8:da283c60 r7:0000000f r6:da645d80 r5:00000001
> >> [  246.758206]  r4:eff213b0
> >> [  246.758214] [<c0435d24>] (f2fs_write_cache_pages) from [<c043682c>] (f2fs_write_data_pages+0x344/0x35c)
> >> [  246.758220]  r10:00000000 r9:d9ed002c r8:d9ed0000 r7:00000004 r6:da283d60 r5:da283c60
> >> [  246.758223]  r4:da645d80
> >> [  246.758238] [<c04364e8>] (f2fs_write_data_pages) from [<c0267ee8>] (do_writepages+0x3c/0xd4)
> >> [  246.758244]  r10:0000000a r9:c0e03d00 r8:00000c00 r7:c0264ddc r6:da645d80 r5:da283d60
> >> [  246.758246]  r4:da283c60
> >> [  246.758254] [<c0267eac>] (do_writepages) from [<c0310cbc>] (__writeback_single_inode+0x44/0x454)
> >> [  246.758259]  r7:da283d60 r6:da645eac r5:da645d80 r4:da283c60
> >> [  246.758266] [<c0310c78>] (__writeback_single_inode) from [<c03112d0>] (writeback_sb_inodes+0x204/0x4b0)
> >> [  246.758272]  r10:0000000a r9:c0e03d00 r8:da283cc8 r7:da283c60 r6:da645eac r5:da283d08
> >> [  246.758274]  r4:d9dc9848
> >> [  246.758281] [<c03110cc>] (writeback_sb_inodes) from [<c03115cc>] (__writeback_inodes_wb+0x50/0xe4)
> >> [  246.758287]  r10:da3797a8 r9:c0e03d00 r8:d9dc985c r7:da645eac r6:00000000 r5:d9dc9848
> >> [  246.758289]  r4:da5a8800
> >> [  246.758296] [<c031157c>] (__writeback_inodes_wb) from [<c03118f4>] (wb_writeback+0x294/0x338)
> >> [  246.758302]  r10:fffbf200 r9:da644000 r8:c0e04e64 r7:d9dc9848 r6:d9dc9874 r5:da645eac
> >> [  246.758305]  r4:d9dc9848
> >> [  246.758312] [<c0311660>] (wb_writeback) from [<c0312dac>] (wb_workfn+0x35c/0x54c)
> >> [  246.758318]  r10:da5f2005 r9:d9dc984c r8:d9dc9948 r7:d9dc9848 r6:00000000 r5:d9dc9954
> >> [  246.758321]  r4:000031e6
> >> [  246.758334] [<c0312a50>] (wb_workfn) from [<c014f2b8>] (process_one_work+0x214/0x544)
> >> [  246.758340]  r10:da5f2005 r9:00000200 r8:00000000 r7:da5f2000 r6:ef044400 r5:da5eb000
> >> [  246.758343]  r4:d9dc9954
> >> [  246.758350] [<c014f0a4>] (process_one_work) from [<c014f634>] (worker_thread+0x4c/0x574)
> >> [  246.758357]  r10:ef044400 r9:c0e03d00 r8:ef044418 r7:00000088 r6:ef044400 r5:da5eb014
> >> [  246.758359]  r4:da5eb000
> >> [  246.758368] [<c014f5e8>] (worker_thread) from [<c01564fc>] (kthread+0x144/0x170)
> >> [  246.758374]  r10:ec9e5e90 r9:dabf325c r8:da5eb000 r7:da644000 r6:00000000 r5:da5fe000
> >> [  246.758377]  r4:dabf3240
> >> [  246.758386] [<c01563b8>] (kthread) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
> >> [  246.758391] Exception stack(0xda645fb0 to 0xda645ff8)
> >> [  246.758397] 5fa0:                                     00000000 00000000 00000000 00000000
> >> [  246.758402] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> >> [  246.758407] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >> [  246.758413]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c01563b8
> >> [  246.758416]  r4:da5fe000
> >> .
> >>
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
