Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A465246C6DB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Dec 2021 22:44:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1muiFn-0000Df-Jg; Tue, 07 Dec 2021 21:44:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1muiFm-0000DZ-28
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 21:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RDPQ9vyelUixWx6VniziMXRDbT/Ch2NiVXoRBiXhBds=; b=InZZusiQpUaeXMtmVT8L2Aj84k
 eS+jhitY0bM19hWSg0JUeSQPpH8weapEZWFZILs37EuXpNG7ZgpNtFPpSZHzYbMLfq2KPDVs8BvSL
 N2YXACTQ++7XEhwZRyyc4O3Yu51lVFxj1V0CyiPDi7+HihoemXhpN8yQ5Gf8G4Lvy3Pw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RDPQ9vyelUixWx6VniziMXRDbT/Ch2NiVXoRBiXhBds=; b=NvVv5PEG25gK7itHLbGwqf/z/Z
 F6ehV3vWT9sMN5iKceQhnj1KUJdU58R3sHi817z83dpaSSI9YBbLyPktHU9eKVpYIZMTW9rYvIhaz
 afweES4fom0YHzx85/P2d2GiKUnsJXEWGs2lmdNAwg3i4R3A9KgrKX/rrVszFOHMa9Do=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1muiFm-007zLn-5p
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 21:44:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D7212B81E7E;
 Tue,  7 Dec 2021 21:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76438C341C1;
 Tue,  7 Dec 2021 21:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638913430;
 bh=RIC9HBzLbN2lHbDafg+TWH6y9VXBU304peip0uDTiEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GsLwrrSoKgfFm4vtac4367QpWwWeGdZdizT6Ak3Ca+hMHUvHMcxHHZG1yoRu8St6i
 L3YzBFAiS3EUbVxg9q6advcmfIutgEKJatGFkdhTWXIbVfI2zva0Is4ngmN91ITvyP
 bwANf3DFhhXv8eQsq7CkOYHEwxglz/a2uKy8Mzkc7MMu8C8l/8o9Q/MQp1dCDc7hRl
 yVCz5sj3gi/tJB6KpebyCR4hzbPQdD17Gp8bocKr3PN3MX6m9T6rI1Ap3GM0s99QED
 GjLvL5mv770bCZ40qlRJuN6e0PVnH0C/pkXpLfkbypDqYkA1vmSxrVKnXolTgyMVdc
 Nz4FY1pZzO0uw==
Date: Tue, 7 Dec 2021 13:43:48 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Ananth Bhaskararaman <antsub@gmail.com>
Message-ID: <Ya/VlEjA/AfUlsP8@google.com>
References: <00F7D971-AEE1-4EBC-86AE-CA9BAB947D96@getmailspring.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00F7D971-AEE1-4EBC-86AE-CA9BAB947D96@getmailspring.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/05, Ananth Bhaskararaman wrote: > I have a multi-disk
 f2fs device, and when I run lsblk, it shows the fs > only on the main device.
 > I'd like all devices to show up with the mounted fs like btr [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1muiFm-007zLn-5p
Subject: Re: [f2fs-dev] Multi device fs and udev
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/05, Ananth Bhaskararaman wrote:
> I have a multi-disk f2fs device, and when I run lsblk, it shows the fs
> only on the main device.
> I'd like all devices to show up with the mounted fs like btrfs
> multi-device arrays.
> I'd also like udev to recognise that both devices are used by this fs.
> Right now, the second device just shows up as unknown.
> 
> I'm intereseted in adding this support myself.
> I'd appreciate any tips on where I can get started with this.

Hi,

You can get the block list from f2fs superblock in the first 4KB.

 740 struct f2fs_super_block {
 741         __le32 magic;                   /* Magic Number */
 742         __le16 major_ver;               /* Major Version */
 743         __le16 minor_ver;               /* Minor Version */
 744         __le32 log_sectorsize;          /* log2 sector size in bytes */
 745         __le32 log_sectors_per_block;   /* log2 # of sectors per block */
 746         __le32 log_blocksize;           /* log2 block size in bytes */
 747         __le32 log_blocks_per_seg;      /* log2 # of blocks per segment */
 748         __le32 segs_per_sec;            /* # of segments per section */
 749         __le32 secs_per_zone;           /* # of sections per zone */
 750         __le32 checksum_offset;         /* checksum offset inside super block */
 751         __le64 block_count;             /* total # of user blocks */
 752         __le32 section_count;           /* total # of sections */
 753         __le32 segment_count;           /* total # of segments */
 754         __le32 segment_count_ckpt;      /* # of segments for checkpoint */
 755         __le32 segment_count_sit;       /* # of segments for SIT */
 756         __le32 segment_count_nat;       /* # of segments for NAT */
 757         __le32 segment_count_ssa;       /* # of segments for SSA */
 758         __le32 segment_count_main;      /* # of segments for main area */
 759         __le32 segment0_blkaddr;        /* start block address of segment 0 */
 760         __le32 cp_blkaddr;              /* start block address of checkpoint */
 761         __le32 sit_blkaddr;             /* start block address of SIT */
 762         __le32 nat_blkaddr;             /* start block address of NAT */
 763         __le32 ssa_blkaddr;             /* start block address of SSA */
 764         __le32 main_blkaddr;            /* start block address of main area */
 765         __le32 root_ino;                /* root inode number */
 766         __le32 node_ino;                /* node inode number */
 767         __le32 meta_ino;                /* meta inode number */
 768         __u8 uuid[16];                  /* 128-bit uuid for volume */
 769         __le16 volume_name[MAX_VOLUME_NAME];    /* volume name */
 770         __le32 extension_count;         /* # of extensions below */
 771         __u8 extension_list[F2FS_MAX_EXTENSION][8];     /* extension array */
 772         __le32 cp_payload;
 773         __u8 version[VERSION_LEN];      /* the kernel version */
 774         __u8 init_version[VERSION_LEN]; /* the initial kernel version */
 775         __le32 feature;                 /* defined features */
 776         __u8 encryption_level;          /* versioning level for encryption */
 777         __u8 encrypt_pw_salt[16];       /* Salt used for string2key algorithm */
 778         struct f2fs_device devs[MAX_DEVICES];   /* device list */

------------------------------------------
 735 struct f2fs_device {
 736         __u8 path[MAX_PATH_LEN];
 737         __le32 total_segments;
 738 } __attribute__((packed));

Here.

 ----------------------------------------
 779         __le32 qf_ino[F2FS_MAX_QUOTAS]; /* quota inode numbers */
 780         __u8 hot_ext_count;             /* # of hot file extension */
 781         __le16  s_encoding;             /* Filename charset encoding */
 782         __le16  s_encoding_flags;       /* Filename charset encoding flags */
 783         __u8 reserved[306];             /* valid reserved region */
 784         __le32 crc;                     /* checksum of superblock */
 785 } __attribute__((packed));

Thanks,

> 
> Ananth
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
