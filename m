Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BB1B82EAA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Sep 2025 06:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:Message-ID:Date:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yq7+w3Au235z7SJPqHRXvWGjDecji4NaRALvziyEggw=; b=VpQfSHqfMO7GHy95kvWa9mUNir
	/EMWgqccLw/ntJTd4EtWHv/krtB8KmTJz6aPoflo8DoM0FR4pVDR7x0wXBDUdrkaA1Z9D+XbJ1VAS
	GkZBtdBD+GqQZynydnJSKEYGYsHK8kVDcJyaG0ukuIz4s7wySzLT5N22/jfOpILqdc7o=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uz6gb-0007wz-QW;
	Thu, 18 Sep 2025 04:56:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yunji0.kang@samsung.com>) id 1uz6gZ-0007wh-Vd
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 04:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zefas1JuGiUdEFTbKhZnv+ZVIOySC9g42o1FgVXKi8U=; b=YNXJqjU2ZlRRwchNV9CKfjEF3v
 xJ2ofinWXPX+xjEsDIfpwpY7ntLASL7QIBJ0C+UTA/93IkcmcSvQSSxzgBl8bL6teRTWRT5/Zzcbz
 06I/OT/IC7vhhfyqzUvA/wDoDrfT9A3/+l6ZQuMreCr/VDNNfuUTQ2kt/RaHuy95ZxvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zefas1JuGiUdEFTbKhZnv+ZVIOySC9g42o1FgVXKi8U=; b=Hi5/JfJUigeT28AcjltBBKI1FJ
 6lDVy/795ll8NclQC0qhyYNVF7jppEvrtpOol8qLbAAZttKP4Ioj2wuFHtBG5Ot9/eaZvXqL5KXtj
 TCG3i94L0gi8tgbmFzWbGYI375IQjZb1ivwWQOmhCqD5qcPCBNIECF0bbUJkrJz7sZLA=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uz6gY-0006jr-Qn for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 04:55:59 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250918045546epoutp043889056b038801e4c89c778f02e80173~mR4ZI1UeG1983519835epoutp040
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Sep 2025 04:55:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250918045546epoutp043889056b038801e4c89c778f02e80173~mR4ZI1UeG1983519835epoutp040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1758171346;
 bh=Zefas1JuGiUdEFTbKhZnv+ZVIOySC9g42o1FgVXKi8U=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=CSIr6b7Fi9L/y3bWgOaOXCyXlH0zCSLmyBuhcWL6TA2EJmmwuLHl/slfF80k5VFlv
 UfLNJ4DCYyuooTJGtTpte4C6JcWFU73xqvO3XDiuAx/MBPTfVjtg0QKSxwHz1lagwE
 lWe+T1ZAyoNx5CoxCjKLlRpAI8Lxv4TKqJs7+CPk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPS id
 20250918045546epcas1p378af9aae47cab22e9f998f4efd2254b6~mR4Y2dbiW2531025310epcas1p3s;
 Thu, 18 Sep 2025 04:55:46 +0000 (GMT)
Received: from epcas1p4.samsung.com (unknown [182.195.38.247]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cS3HQ1WX0z2SSKX; Thu, 18 Sep
 2025 04:55:46 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20250918045545epcas1p4c45f2104438d05dbb02f9cfb92cae8c6~mR4YMpbGq0638406384epcas1p4a;
 Thu, 18 Sep 2025 04:55:45 +0000 (GMT)
Received: from yunji0kang01 (unknown [10.253.100.171]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250918045545epsmtip13d05c5d1c33b18a3a7bef7a56b69ab42~mR4YJVSxw0616806168epsmtip1P;
 Thu, 18 Sep 2025 04:55:45 +0000 (GMT)
From: "Yunji Kang" <yunji0.kang@samsung.com>
To: "'Chao Yu'" <chao@kernel.org>, <jaegeuk@kernel.org>
In-Reply-To: <de32bc26-6424-4750-83f7-17956e6727cd@kernel.org>
Date: Thu, 18 Sep 2025 13:55:45 +0900
Message-ID: <000a01dc2858$7e50f460$7af2dd20$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHGlTO1sK2WH87Ru+8OHbgyt7E/JwJw0GzGAYBuEl+0o/nd0A==
Content-Language: ko
X-CMS-MailID: 20250918045545epcas1p4c45f2104438d05dbb02f9cfb92cae8c6
X-Msg-Generator: CA
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917055237epcas1p2faa1b3d6555ffc5179c700e7a2afd448
References: <CGME20250917055237epcas1p2faa1b3d6555ffc5179c700e7a2afd448@epcas1p2.samsung.com>
 <20250917055217.39960-1-yunji0.kang@samsung.com>
 <de32bc26-6424-4750-83f7-17956e6727cd@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > > In f2fs_precache_extents(), For large files, It requires
 reading many > > node blocks. Instead of reading each node block with
 synchronous
 I/O, > > this patch applies readahead so that node blocks [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uz6gY-0006jr-Qn
Subject: Re: [f2fs-dev] [PATCH] f2fs: readahead node block in
 F2FS_GET_BLOCK_PRECACHE mode
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
Cc: 'Sungjong Seo' <sj1557.seo@samsung.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> > In f2fs_precache_extents(), For large files, It requires reading many
> > node blocks. Instead of reading each node block with synchronous I/O,
> > this patch applies readahead so that node blocks can be fetched in
> > advance.
> >
> > It reduces the overhead of repeated sync reads and improves efficiency
> > when precaching extents of large files.
> >
> > I created a file with the same largest extent and executed the test.
> > For this experiment, I set the file's largest extent with an offset of
> > 0 and a size of 1GB. I configured the remaining area with 100MB extents.
> >
> > 5GB test file:
> > dd if=/dev/urandom of=test1 bs=1m count=5120 cp test1 test2 fsync
> > test1 dd if=test1 of=test2 bs=1m skip=1024 seek=1024 count=100
> > conv=notrunc dd if=test1 of=test2 bs=1m skip=1224 seek=1224 count=100
> > conv=notrunc ...
> > dd if=test1 of=test2 bs=1m skip=5024 seek=5024 count=100 conv=notrunc
> > reboot
> >
> > I also created 10GB and 20GB files with large extents using the same
> > method.
> >
> > ioctl(F2FS_IOC_PRECACHE_EXTENTS) test results are as follows:
> >   +-----------+---------+---------+-----------+
> >   | File size | Before  | After   | Reduction |
> >   +-----------+---------+---------+-----------+
> >   | 5GB       | 101.8ms | 72.1ms  | 29.2%     |
> >   | 10GB      | 222.9ms | 149.5ms | 32.9%     |
> >   | 20GB      | 446.2ms | 276.3ms | 38.1%     |
> >   +-----------+---------+---------+-----------+
> > Tested on a 256GB mobile device with an SM8750 chipset.
> >
> > Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> > Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
> > Signed-off-by: Yunji Kang <yunji0.kang@samsung.com>
> > ---
> >  fs/f2fs/data.c | 3 +++
> >  fs/f2fs/f2fs.h | 1 +
> >  fs/f2fs/node.c | 4 +++-
> >  3 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c index
> > 7961e0ddfca3..ab3117e3b24a 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1572,6 +1572,9 @@ int f2fs_map_blocks(struct inode *inode, struct
> f2fs_map_blocks *map, int flag)
> >  	pgofs =	(pgoff_t)map->m_lblk;
> >  	end = pgofs + maxblocks;
> >
> > +	if (flag == F2FS_GET_BLOCK_PRECACHE)
> > +		mode = LOOKUP_NODE_PRECACHE;
> > +
> >  next_dnode:
> >  	if (map->m_may_create) {
> >  		if (f2fs_lfs_mode(sbi))
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h index
> > 9d3bc9633c1d..3ce41528d48e 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -651,6 +651,7 @@ enum {
> >  					 * look up a node with readahead called
> >  					 * by get_data_block.
> >  					 */
> > +	LOOKUP_NODE_PRECACHE,		/* look up a node for
> F2FS_GET_BLOCK_PRECACHE */
> >  };
> >
> >  #define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO or flush
> count */
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c index
> > 4254db453b2d..50be167e5c59 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -860,7 +860,9 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn,
> pgoff_t index, int mode)
> >  			set_nid(parent, offset[i - 1], nids[i], i == 1);
> >  			f2fs_alloc_nid_done(sbi, nids[i]);
> >  			done = true;
> > -		} else if (mode == LOOKUP_NODE_RA && i == level && level > 1)
> {
> > +		} else if ((mode == LOOKUP_NODE_RA ||
> 
> Does this change the logic for mode = LOOKUP_NODE_RA?
> 
> Not sure, do you mean this?
> 
> 	if ((i == level && level > 1) &&
> 		(mode == LOOKUP_NODE_RA ||
> 		(mode == LOOKUP_NODE_PRECACHE &&
> 		offset[i - 1] % MAX_RA_NODE == 0)))
> 
> Thanks,
> 
> > +				(mode == LOOKUP_NODE_PRECACHE && offset[i - 1] %
> MAX_RA_NODE == 0))
> > +				&& i == level && level > 1) {
> >  			nfolio[i] = f2fs_get_node_folio_ra(parent, offset[i -
> 1]);
> >  			if (IS_ERR(nfolio[i])) {
> >  				err = PTR_ERR(nfolio[i]);

I think the code has the same meaning.
The version you wrote looks more readable, so would it be okay if I change the patch with your code?

Also, I did not change the logic for mode = LOOKUP_NODE_RA; I only added a condition for when readahead is performed.

Thanks.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
