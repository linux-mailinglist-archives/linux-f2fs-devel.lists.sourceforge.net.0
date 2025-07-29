Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E94BB14FD6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Jul 2025 16:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aga7crMkCuBnjVRMTbjykiHCNzd47abYOaXBXvHrUrk=; b=OwbVn8MmnxtFzAulLhOggx4HIA
	3ftCI4l+9v2ZwSG/1f2RJqgIdNx8bD09sx74OnD0NqJE0z/v5321ZP+V2vTpheuE1osgJ8NCPw7HG
	KEzaUWIjJl14wkfLJf81GXqreVK7mXKJnr8F8zg6zt968BZolLkn9ThX7drbISwv0qNU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uglnl-0003BH-Kj;
	Tue, 29 Jul 2025 14:59:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uglnk-0003BB-GU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 14:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Gz7A//T+fmC0anb5chi0JkpzKzflv1TPCtsbvD6RHc=; b=IPeS80cWsEOskOm+mfKGQsQ+l9
 cuYRfVqrmF34Ke60QL23US6LxRtXpK2Kn0IovZrjsUisMRwQWoISNMDOKh9wr9wSH6wXmZanHQG+N
 2Te/xZyd7IRWUdo2ayqV24FEfIBw9m2VffCBWq0Iz4DdNuUEFNo3fZw+JFcw34sXyonE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Gz7A//T+fmC0anb5chi0JkpzKzflv1TPCtsbvD6RHc=; b=XaHW1cslGCVl27EZmaEZVqWFXp
 Hv4OjDhBFvqbG7lq5Ry12z7fJqKS4aGMARDgmOQucf/qFfoRYoA77zNIGchz/k4YvpMrUfJAKYhax
 645ntCHeLGxo/dxspx2J6x5jAZb5pVlJFKaef5lkEHM1F0PMm4UFQRLPWaBsgsF5Sdmg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uglnj-0005XV-R4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 14:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6F44E45002;
 Tue, 29 Jul 2025 14:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265DFC4CEEF;
 Tue, 29 Jul 2025 14:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753801170;
 bh=4kTJxrEAlg7O+BBG2HwAC0Tpdg7EMDZiRbDnRLv0s4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J1LVxQCVY1xW7nHk4pNYNInIwAVwKjbmhkfH79S8smGC3O1XBOkpF11B2QgKU/IjA
 RmPdjv04lBrtFZ2R71VpLRmc4DLMctpAi8MJrmlLlyj5B3BZWugA7qfUIOEANrdI+/
 73LWHSA4NtGOQXKYyrvIiE4JPBaO/W9+yW2FqsbPCW+0GeQlIySARwVAulx4Zty984
 /U3LcOkz9y6pk4nI9nyVUiR94E8ux0nQAA9RPEZt7WwUq1+2G/l8hQrpWcaUx+4mB1
 xU9OOvaeG9MwsELcRuWtriqN71E4M9hasS3bufau5Jxj89jcyBUY/34h//0BL4/zv0
 J6i768+k5QrfQ==
Date: Tue, 29 Jul 2025 14:59:28 +0000
To: Cherniaev Andrei <dungeonlords789@naver.com>
Message-ID: <aIjh0Moy6-MJmTE-@google.com>
References: <20250516111026.134657-1-dungeonlords789@naver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250516111026.134657-1-dungeonlords789@naver.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Applied with limiting 80 columns. On 05/16, Cherniaev Andrei
 wrote: > I think my optimization makes mkfs.f2fs faster in case of invalid
 volume size. So with the commit user will get err faster. > Before start
 I suggest add debug print [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uglnj-0005XV-R4
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Applied with limiting 80 columns.

On 05/16, Cherniaev Andrei wrote:
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
> ---
>  include/f2fs_fs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index f7268d1..41755af 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1891,7 +1891,7 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
>  	for (; candidate <= end; candidate += diff) {
>  		reserved = get_reserved(sb, candidate);
>  		ovp = (usable_main_segs - reserved) * candidate / 100;
> -		if (ovp < 0)
> +		if (ovp <= 0)
>  			continue;
>  		space = usable_main_segs - max((double)reserved, ovp) -
>  					overprovision_segment_buffer(sb);
> -- 
> 2.45.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
