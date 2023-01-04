Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0152B65CD64
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 07:56:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCxhI-0007zf-Dn;
	Wed, 04 Jan 2023 06:56:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ojaswin@linux.ibm.com>) id 1pCxhG-0007zZ-Kc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 06:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wTKVshHb8Cb9JZbO0OIriLykG/+Dx1vrtKYkskIvVKA=; b=bKaVRU4Xep2jE31VR+g4ILvwMb
 3WZZZYl4YbNZvKfCMR1UsIusD6oqXwIKJABf3RSF7q5FW0X4JdtSInc3pN8tPOZ0Gu6rNIo62tw1s
 q3tO+El3P8yjk2COhm6m5B+G+pLwCtjLw4YwfTVF2JaTt9+kVYqwCwe2Lc0NCnbsLYQI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wTKVshHb8Cb9JZbO0OIriLykG/+Dx1vrtKYkskIvVKA=; b=QBg3HgMo99OtYRFdX3xg/sQeRI
 0z1WZ0dUPCuC9mLwAqWu8BqbkbvRo2ZG+wsEtw/3DseJB5oopDV/6UoxOcq8L6Wk6tsdTaty93I4J
 HVitIq3dKADX4DIjuWLAik1cAtVyRv+fjS66SQYfl0MEIK1jd8icKTKCSZrKZlz57ipY=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pCxhB-0049vn-S5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 06:56:22 +0000
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3045pG8A037064; Wed, 4 Jan 2023 06:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=wTKVshHb8Cb9JZbO0OIriLykG/+Dx1vrtKYkskIvVKA=;
 b=cIlfyRNn1Q8UltIPoA/9pMY57As3eM7p1pe2P7FaG+DADihDsW6VjW9RV14fdFHybA5x
 QimAFFarNUGnwuuhtnmcFsQBSAhDeVWuIt4/rVo2RsuQJBh/89fMnO/QNKIdCidq64K9
 +6OHfyyAYiuEd/sEaPp6XVFx0lR8zqAYAozjbm5s7gY5L8om6iUrp2X5mF63a/P4lK23
 Cx72t0IjPPCnckPl+wZHffNR/zE+1zxrcoAgNUA/DnhUjTaYfQmMYTEVeFAzKPKE8JsU
 xIsEvLcsoemk1gw3NuRRXuQ4iw6CflP6oBSjeK96Qc6sbfSind14hC7sozFdDj6xEsr9 xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvhq8gbb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jan 2023 06:38:24 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3046VvtA025009;
 Wed, 4 Jan 2023 06:38:24 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvhq8gbac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jan 2023 06:38:23 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 303FLfgb020051;
 Wed, 4 Jan 2023 06:38:21 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3mtcq6bh40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jan 2023 06:38:21 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3046cI0244106130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Jan 2023 06:38:19 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D73E32004D;
 Wed,  4 Jan 2023 06:38:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 079EB20040;
 Wed,  4 Jan 2023 06:38:16 +0000 (GMT)
Received: from li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com (unknown
 [9.43.102.169])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  4 Jan 2023 06:38:15 +0000 (GMT)
Date: Wed, 4 Jan 2023 12:08:09 +0530
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Y7UeuYVkyy2/fWF1@li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com>
References: <20221223203638.41293-1-ebiggers@kernel.org>
Content-Disposition: inline
In-Reply-To: <20221223203638.41293-1-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mSO2yQA0QNhulL1X1wgiSw8KYX4-ngjj
X-Proofpoint-GUID: XOFhcEVNgZisMTsYzX1Iq_fDGw_7apHD
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_02,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301040050
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Eric, I have roughly gone through the series and run the
 (patched) xfstests on this patchset on a powerpc machine with 64k pagesize
 and 64k,4k and 1k merkle tree size on EXT4 and everything seems to work co
 [...] Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1pCxhB-0049vn-S5
Subject: Re: [f2fs-dev] [PATCH v2 00/11] fsverity: support for non-4K pages
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
From: Ojaswin Mujoo via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

I have roughly gone through the series and run the (patched) xfstests on
this patchset on a powerpc machine with 64k pagesize and 64k,4k and 1k
merkle tree size on EXT4 and everything seems to work correctly. 

Just for records, test generic/692 takes a lot of time to complete with
64k merkel tree size due to the calculations assuming it to be 4k,
however I was able to manually test that particular scenario. (I'll try
to send a patch to fix the fstest later).

Anyways, feel free to add:

Tested-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>

Since I was not very familiar with the fsverty codebase, I'll try to
take some more time to review the code and get back with any
comments/RVBs.

Regards,
ojaswin

On Fri, Dec 23, 2022 at 12:36:27PM -0800, Eric Biggers wrote:
> [This patchset applies to mainline + some fsverity cleanups I sent out
>  recently.  You can get everything from tag "fsverity-non4k-v2" of
>  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git ]
> 
> Currently, filesystems (ext4, f2fs, and btrfs) only support fsverity
> when the Merkle tree block size, filesystem block size, and page size
> are all the same.  In practice that means 4K, since increasing the page
> size, e.g. to 16K, forces the Merkle tree block size and filesystem
> block size to be increased accordingly.  That can be impractical; for
> one, users want the same file signatures to work on all systems.
> 
> Therefore, this patchset reduces the coupling between these sizes.
> 
> First, patches 1-4 are cleanups.
> 
> Second, patches 5-9 allow the Merkle tree block size to be less than the
> page size or filesystem block size, provided that it's not larger than
> either one.  This involves, among other things, changing the way that
> fs/verity/verify.c tracks which hash blocks have been verified.
> 
> Finally, patches 10-11 make ext4 support fsverity when the filesystem
> block size is less than the page size.  Note, f2fs doesn't need similar
> changes because f2fs always assumes that the filesystem block size and
> page size are the same anyway.  I haven't looked into btrfs yet.
> 
> I've tested this patchset using the "verity" group of tests in xfstests
> with the following xfstests patchset applied:
> "[PATCH v2 00/10] xfstests: update verity tests for non-4K block and page size"
> (https://lore.kernel.org/fstests/20221223010554.281679-1-ebiggers@kernel.org/T/#u)
> 
> Note: on the thread "[RFC PATCH 00/11] fs-verity support for XFS"
> (https://lore.kernel.org/linux-xfs/20221213172935.680971-1-aalbersh@redhat.com/T/#u)
> there have been many requests for other things to support, including:
> 
>   * folios in the pagecache
>   * alternative Merkle tree caching methods
>   * direct I/O
>   * merkle_tree_block_size > page_size
>   * extremely large files, using a reclaimable bitmap
> 
> We shouldn't try to boil the ocean, though, so to keep the scope of this
> patchset manageable I haven't changed it significantly from v1.  This
> patchset does bring us closer to many of the above, just not all the way
> there.  I'd like to follow up this patchset with a change to support
> folios, which should be straightforward.  Next, we can do a change to
> generalize the Merkle tree interface to allow XFS to use an alternative
> caching method, as that sounds like the highest priority item for XFS.
> 
> Anyway, the changelog is:
> 
> Changed in v2:
>    - Rebased onto the recent fsverity cleanups.
>    - Split some parts of the big "support verification" patch into
>      separate patches.
>    - Passed the data_pos to verify_data_block() instead of computing it
>      using page->index, to make it ready for folio and DIO support.
>    - Eliminated some unnecessary arithmetic in verify_data_block().
>    - Changed the log_* fields in merkle_tree_params to u8.
>    - Restored PageLocked and !PageUptodate checks for pagecache pages.
>    - Eliminated the change to fsverity_hash_buffer().
>    - Other small cleanups
> 
> Eric Biggers (11):
>   fsverity: use unsigned long for level_start
>   fsverity: simplify Merkle tree readahead size calculation
>   fsverity: store log2(digest_size) precomputed
>   fsverity: use EFBIG for file too large to enable verity
>   fsverity: replace fsverity_hash_page() with fsverity_hash_block()
>   fsverity: support verification with tree block size < PAGE_SIZE
>   fsverity: support enabling with tree block size < PAGE_SIZE
>   ext4: simplify ext4_readpage_limit()
>   f2fs: simplify f2fs_readpage_limit()
>   fs/buffer.c: support fsverity in block_read_full_folio()
>   ext4: allow verity with fs block size < PAGE_SIZE
> 
>  Documentation/filesystems/fsverity.rst |  76 +++---
>  fs/buffer.c                            |  67 ++++-
>  fs/ext4/readpage.c                     |   3 +-
>  fs/ext4/super.c                        |   5 -
>  fs/f2fs/data.c                         |   3 +-
>  fs/verity/enable.c                     | 260 ++++++++++----------
>  fs/verity/fsverity_private.h           |  20 +-
>  fs/verity/hash_algs.c                  |  24 +-
>  fs/verity/open.c                       |  98 ++++++--
>  fs/verity/verify.c                     | 325 +++++++++++++++++--------
>  include/linux/fsverity.h               |  14 +-
>  11 files changed, 565 insertions(+), 330 deletions(-)
> 
> -- 
> 2.39.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
