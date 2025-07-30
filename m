Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEDCB15989
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Jul 2025 09:27:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xqk2LXIA73LRVWG+4tiY794gQWbi7l3R1/MMs9euNA=; b=iSOAgKgS0Ay1NkthjHVYFohvUy
	IjeWCKJGiaDSsKwwywBr9/kv+OleiWn0yvaUZesRtfDRFOjhaFiz/caKIFxs11fiqGj8Tqe8yf/rf
	gqd5ZlvmNR1P08jDYYAOMAaOli5kC55MbI9LhmkRQP5lLvfh6Md17TN/8ubkd+aaI3oo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uh1DA-0000sT-BP;
	Wed, 30 Jul 2025 07:26:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uh1D7-0000sL-8P
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 07:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PU3wRnRNnJUMjKMkiuYqaqrYevYnejybx1UgmEwWhCc=; b=Yc/h0J16lXCEzKZqTjiYcY68dy
 8hLUulHVt61W4cCJ8ClssoMVobljHVwOiWE+VtTfgqQCXQNPHpxPC76hDjCTjioQFuYaPvscUBoIH
 w3oeD0ktxM5wxT42wwNxk9bNTQhfYGbEoA0WT9KsVuoONYDefX1kpc5a9fpsHNYzSnDc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PU3wRnRNnJUMjKMkiuYqaqrYevYnejybx1UgmEwWhCc=; b=jEDIWA4RxXi6HKTfeaQxvuD+Et
 znI1Uo7f60hHYJ/33qroIosoIAxiFy13CWHTuSgKArEq+bZMZCRQB25gjQ6mpde7lEdheyAPhlbKR
 xOG/lWhIr33Ibf1N7Bh0AvXuzGYMfW4hcKf0rb9w1MArfh29mCu41HpySrrvnIYbZIq4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uh1D6-0008BL-FY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 07:26:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CB30A60007;
 Wed, 30 Jul 2025 07:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAABC4CEE7;
 Wed, 30 Jul 2025 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753860402;
 bh=Fx/+X9DAUT3KzLXFH+JzN1//i7sjdGxn3C5giRayjFo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=vMf4YFwzxc2a0SgbaWjm89c6c69YbD1Df2ZGKwRzrtWrf7eVLZjSAyQV0FG/DhtJ2
 0cy4gjcykAGWop/5DJkwRSCsx2k+gmb6LHYU+d0RbF0YdTUxytfmWnLoz8abyjz7Wx
 RWIh+QSmth/JOZa2vKZnKrML1lFHrSg/OzE2vGhcO/1JQboZ88IKlA71v0dpUh+qRr
 7mYPeH8tw/hlIDoW1k4MgebggitD4clioVZdp8sXy/TPwK4LKgS58rfVhBnrtVWPok
 +4RAREKAU8gj3sPtQtKKrb6v2lHEYJyXs55chFKQ+ZXCpy+RUt/OeVIn/qVd4ZYrvx
 4BEHOwpmDpHjg==
Message-ID: <30408c77-415a-4947-900b-518daa43d2bb@kernel.org>
Date: Wed, 30 Jul 2025 15:26:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cherniaev Andrei <dungeonlords789@naver.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250516111026.134657-1-dungeonlords789@naver.com>
Content-Language: en-US
In-Reply-To: <20250516111026.134657-1-dungeonlords789@naver.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/16/25 19:10,
 Cherniaev Andrei wrote: > I think my optimization
 makes mkfs.f2fs faster in case of invalid volume size. So with the commit
 user will get err faster. > Before start I suggest add deb [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uh1D6-0008BL-FY
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs-tools: increase overprovision
 finding speed
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/16/25 19:10, Cherniaev Andrei wrote:
> I think my optimization makes mkfs.f2fs faster in case of invalid volume size. So with the commit user will get err faster.
> Before start I suggest add debug printf() to `f2fs_fs.h` like this:
> ```
> for (; candidate <= end; candidate += diff) {
> 	reserved = get_reserved(sb, candidate);
> 	ovp = (usable_main_segs - reserved) * candidate / 100;
> MSG(0, "ovp=%f usable_main_segs=%u reserved=%u candidate=%f\n", ovp, usable_main_segs, reserved, candidate); //debug printf()
> if (ovp <= 0)
> 		continue;
> 	space = usable_main_segs - max((double)reserved, ovp) -
> 				overprovision_segment_buffer(sb);
> MSG(0, "space=%f max_space=%f\n", space, max_space); //debug printf()
> 	if (max_space < space) {
> 		max_space = space;
> 		max_ovp = candidate;
> 	}
> }
> ```
> 
> Test instruction is based on "boot/grub2/readme.txt" https://gitlab.com/buildroot.org/buildroot/-/blob/master/boot/grub2/readme.txt You can use Ubuntu 24 or similar OS.
> 1. Create a disk image
> ```
> cd /tmp
> dd if=/dev/zero of=disk.img bs=1M count=32
> ```
> 2. Partition it with GPT partitions usinig `cgdisk disk.img` or
> ```
> parted --script disk.img mklabel gpt mkpart primary 1MiB 31MiB
> ```
> 3. Setup loop device and loop partitions
> ```
> loop_dev=$(sudo losetup -f --show disk.img)
> sudo partx -a "$loop_dev"
> ```
> 5. Prepare the root partition
> ```
> sudo mkfs.f2fs -f -l mylable123 -i -O extra_attr,inode_checksum,sb_checksum,compression -e raw -E bin "$loop_dev"
> ```
> 6. Cleanup loop device
> ```
> partx -d "$loop_dev"
> losetup -d "$loop_dev"
> ```
> In log you can see that for ovp==0.0 space calculation looks not necessary...
> ```
> a@Linux:~$ sudo mkfs.f2fs -f -l mylable123 -i -O extra_attr,inode_checksum,sb_checksum,compression -e raw -E bin "$loop_dev"
> 
>     F2FS-tools: mkfs.f2fs Ver: 1.16.0 (2025-05-06)
> 
> Info: Debug level = 0
> Info: Add new cold file extension list
> Info: Add new hot file extension list
> Info: Label = mylable123
> Info: Trim is enabled
> Info: Enable Compression
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 512
> Info: total sectors = 65536 (32 MB)
> Info: zone aligned segment0 blkaddr: 512
> ovp=429496728.700000 usable_main_segs=8 reserved=17 candidate=10.000000
> space=-429496726.700000 max_space=0.000000
> ovp=644245093.650000 usable_main_segs=8 reserved=13 candidate=15.000000
> space=-644245091.650000 max_space=0.000000
> ovp=858993458.400000 usable_main_segs=8 reserved=12 candidate=20.000000
> space=-858993456.400000 max_space=0.000000
> ovp=1073741823.250000 usable_main_segs=8 reserved=11 candidate=25.000000
> space=-1073741821.250000 max_space=0.000000
> ovp=1288490188.200000 usable_main_segs=8 reserved=10 candidate=30.000000
> space=-1288490186.200000 max_space=0.000000
> ovp=1503238553.250000 usable_main_segs=8 reserved=9 candidate=35.000000
> space=-1503238551.250000 max_space=0.000000
> ovp=1717986918.000000 usable_main_segs=8 reserved=9 candidate=40.000000
> space=-1717986916.000000 max_space=0.000000
> ovp=1932735282.750000 usable_main_segs=8 reserved=9 candidate=45.000000
> space=-1932735280.750000 max_space=0.000000
> ovp=2147483647.500000 usable_main_segs=8 reserved=9 candidate=50.000000
> space=-2147483645.500000 max_space=0.000000
> ovp=0.000000 usable_main_segs=8 reserved=8 candidate=55.000000
> space=-6.000000 max_space=0.000000
> ovp=0.000000 usable_main_segs=8 reserved=8 candidate=60.000000
> space=-6.000000 max_space=0.000000
> ovp=0.000000 usable_main_segs=8 reserved=8 candidate=65.000000
> space=-6.000000 max_space=0.000000
> ovp=0.000000 usable_main_segs=8 reserved=8 candidate=70.000000
> space=-6.000000 max_space=0.000000
> ovp=0.000000 usable_main_segs=8 reserved=8 candidate=75.000000
> space=-6.000000 max_space=0.000000
> ovp=0.000000 usable_main_segs=8 reserved=8 candidate=80.000000
> space=-6.000000 max_space=0.000000
> ovp=0.000000 usable_main_segs=8 reserved=8 candidate=85.000000
> space=-6.000000 max_space=0.000000
> ovp=0.000000 usable_main_segs=8 reserved=8 candidate=90.000000
> space=-6.000000 max_space=0.000000
> ovp=0.000000 usable_main_segs=8 reserved=8 candidate=95.000000
> space=-6.000000 max_space=0.000000
> 	Error: Device size is not sufficient for F2FS volume
> 	Error: Failed to prepare a super block!!!
> 	Error: Could not format the device!!!
> ```
> 
> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
