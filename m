Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F8095CD8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2019 13:05:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i01xK-0005KF-8H; Tue, 20 Aug 2019 11:05:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jlayton@kernel.org>)
 id 1i01x8-0005Ib-Hr; Tue, 20 Aug 2019 11:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KN7MhTJDNAcV4LKnSEuG+Sd5RLBLmEzt5X+g9oyk5Ig=; b=LVncEwukOrRYtUkpYL5CyjO4FV
 tivbBVAeZbCAXTINZUihq7y1uzc09SmY+tZFJr7GK4dPv88JMOlDnH2pSLKjxM3bjk8zhPlBZ6C7r
 PgpbuXCXFZudVmocJfWFG8WG9XpHWS/BV4UxjChixJiSd4UeZi8FLvUgO+n3pKPLY4Po=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KN7MhTJDNAcV4LKnSEuG+Sd5RLBLmEzt5X+g9oyk5Ig=; b=TY3K2+Dw/d4nPXDrHWi8Zk2koN
 80SHAxroPbzyBA7IjuMd4IhW7rUQG52lbDRa80l7QKKZPOJA9pfruheia6fnWpXB+hYH0SJlOMrsn
 MthTinKikPszbEoCm3rOnF6cDcX64UgPbx9IXVKu0rRBkbagSKLXIG/7xs002lF4VXaI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i01x5-00D6c9-Gf; Tue, 20 Aug 2019 11:05:26 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFF55205C9;
 Tue, 20 Aug 2019 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566299116;
 bh=T0rmHh8w3H3bwdXLru7KFY2A/8hjJcNt2eMc9MdFvoU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=OWYdJNUzSee+UuIh6LQ3YFru0x6seE2TTCifysIDGNOjR8O4ScYkdj2Vrw5S/JeTB
 qmDzLYeDaoNBfNwX5IDihFikAWZqI1dzLhII85Qm3JJy6zIH2yIFue45EEMtXZPwcN
 fgzdH+WlULgP+SUhyw7NDBScX/I9XuZMIU+ITkEg=
Message-ID: <27d1943a0027cb4f658334fad8dc880df133c22d.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Deepa Dinamani <deepa.kernel@gmail.com>, viro@zeniv.linux.org.uk, 
 linux-kernel@vger.kernel.org
Date: Tue, 20 Aug 2019 07:05:10 -0400
In-Reply-To: <20190818165817.32634-1-deepa.kernel@gmail.com>
References: <20190818165817.32634-1-deepa.kernel@gmail.com>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i01x5-00D6c9-Gf
Subject: Re: [f2fs-dev] [PATCH v8 00/20] vfs: Add support for timestamp
 limits
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
Cc: lucho@ionkov.net, martin@omnibond.com, jfs-discussion@lists.sourceforge.net,
 shaggy@kernel.org, al@alarsen.net, me@bobcopeland.com,
 adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz, hch@lst.de,
 nico@fluxnic.net, hubcap@omnibond.com, linux-cifs@vger.kernel.org,
 zyan@redhat.com, sage@redhat.com, darrick.wong@oracle.com,
 y2038@lists.linaro.org, richard@nod.at, sfrench@samba.org, anton@enomsg.org,
 codalist@coda.cs.cmu.edu, hch@infradead.org, coda@cs.cmu.edu,
 v9fs-developer@lists.sourceforge.net, idryomov@gmail.com,
 linux-ext4@vger.kernel.org, salah.triki@gmail.com, asmadeus@codewreck.org,
 devel@lists.orangefs.org, dushistov@mail.ru, keescook@chromium.org,
 arnd@arndb.de, ericvh@gmail.com, jack@suse.com, reiserfs-devel@vger.kernel.org,
 tj@kernel.org, jlbec@evilplan.org, aivazian.tigran@gmail.com,
 phillip@squashfs.org.uk, dsterba@suse.com, jaegeuk@kernel.org,
 ceph-devel@vger.kernel.org, trond.myklebust@hammerspace.com,
 hirofumi@mail.parknet.co.jp, jaharkes@cs.cmu.edu, linux-nfs@vger.kernel.org,
 tony.luck@intel.com, tytso@mit.edu, luisbg@kernel.org, dedekind1@gmail.com,
 linux-ntfs-dev@lists.sourceforge.net, gregkh@linuxfoundation.org,
 linux-karma-devel@lists.sourceforge.net, adrian.hunter@intel.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ccross@android.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org, anna.schumaker@netapp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, 2019-08-18 at 09:57 -0700, Deepa Dinamani wrote:
> The series is an update and a more complete version of the
> previously posted series at
> https://lore.kernel.org/linux-fsdevel/20180122020426.2988-1-deepa.kernel@gmail.com/
> 
> Thanks to Arnd Bergmann for doing a few preliminary reviews.
> They helped me fix a few issues I had overlooked.
> 
> The limits (sometimes granularity also) for the filesystems updated here are according to the
> following table:
> 
> File system   Time type                      Start year Expiration year Granularity
> cramfs        fixed                          0          0
> romfs         fixed                          0          0
> pstore        ascii seconds (27 digit ascii) S64_MIN    S64_MAX         1
> coda          INT64                          S64_MIN    S64_MAX         1
> omfs          64-bit milliseconds            0          U64_MAX/ 1000   NSEC_PER_MSEC
> befs          unsigned 48-bit seconds        0          0xffffffffffff  alloc_super
> bfs           unsigned 32-bit seconds        0          U32_MAX         alloc_super
> efs           unsigned 32-bit seconds        0          U32_MAX         alloc_super
> ext2          signed 32-bit seconds          S32_MIN    S32_MAX         alloc_super
> ext3          signed 32-bit seconds          S32_MIN    S32_MAX         alloc_super
> ext4 (old)    signed 32-bit seconds          S32_MIN    S32_MAX         alloc_super
> ext4 (extra)  34-bit seconds, 30-bit ns      S32_MIN    0x37fffffff	1
> freevxfs      u32 secs/usecs                 0          U32_MAX         alloc_super
> jffs2         unsigned 32-bit seconds        0          U32_MAX         alloc_super
> jfs           unsigned 32-bit seconds/ns     0          U32_MAX         1
> minix         unsigned 32-bit seconds        0          U32_MAX         alloc_super
> orangefs      u64 seconds                    0          U64_MAX         alloc_super
> qnx4          unsigned 32-bit seconds        0          U32_MAX         alloc_super
> qnx6          unsigned 32-bit seconds        0          U32_MAX         alloc_super
> reiserfs      unsigned 32-bit seconds        0          U32_MAX         alloc_super
> squashfs      unsigned 32-bit seconds        0          U32_MAX         alloc_super
> ufs1          signed 32-bit seconds          S32_MIN    S32_MAX         NSEC_PER_SEC
> ufs2          signed 64-bit seconds/u32 ns   S64_MIN    S64_MAX         1
> xfs           signed 32-bit seconds/ns       S32_MIN    S32_MAX         1
> ceph          unsigned 32-bit second/ns      0          U32_MAX         1000

Looks reasonable, overall.

Note that the granularity changed recently for cephfs. See commit
0f7cf80ae96c2a (ceph: initialize superblock s_time_gran to 1).

In any case, you can add my Acked-by

-- 
Jeff Layton <jlayton@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
