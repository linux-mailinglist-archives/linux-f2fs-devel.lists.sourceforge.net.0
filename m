Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A32316C3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jul 2020 02:30:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k0ZzR-0000NW-O4; Wed, 29 Jul 2020 00:30:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1k0ZzQ-0000NK-2q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 00:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BogeDhS4Qoc1AQLaDXV500Qb/wYEuPjDVHgebFkIiU8=; b=Fo1wtnKlYpT987gSocXhmS1vTL
 RodFeksokG5lvus7fC6NPlAz0KD4om97LlwblLQrtzzdBpgrK0wH9H9LC/xLRpdO13el6YfTXm5Q/
 kkXSp6Gd60TYNUmOeIfV0rN96o6CDmUuvZcqOJrDxe+DPoaMpImm4mXlP5Xaw1CYUcCw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BogeDhS4Qoc1AQLaDXV500Qb/wYEuPjDVHgebFkIiU8=; b=N
 8TtIbJFdCGgDF9Hz2aDG8gNXCIIiXbrRukB5j5F1fwiA9bXv82MIunVVUWBZFPmLNhrlyEV/7h5qP
 pvu87AfPPdPHcfizutdfC+JSJ3zuZ+uD9+XhpWbtGqhr7/BVeTREUh9EvOAO5DhdRPxQlBGkt6qxv
 tN+6m2vb8OSqvQIA=;
Received: from szxga03-in.huawei.com ([45.249.212.189] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k0ZzL-002dPH-Rr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 00:30:36 +0000
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 810E547945BCEF8C70D4;
 Wed, 29 Jul 2020 08:30:24 +0800 (CST)
Received: from DGGEMM513-MBX.china.huawei.com ([169.254.1.141]) by
 DGGEMM404-HUB.china.huawei.com ([10.3.20.212]) with mapi id 14.03.0487.000;
 Wed, 29 Jul 2020 08:30:23 +0800
From: "Qiujie (Jack)" <jack.qiu@huawei.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH] f2fs: use macro instead of f2fs verity version
Thread-Index: AdZlP2zbrY2LUScHTI64N+0tHktWvQ==
Date: Wed, 29 Jul 2020 00:30:23 +0000
Message-ID: <9E81852FD51EDB42A790F24E63A53FC0B186F821@dggemm513-mbx.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.179.179]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.189 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1k0ZzL-002dPH-Rr
Subject: Re: [f2fs-dev] [PATCH] f2fs: use macro instead of f2fs verity
 version
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

> On 07/25, Jack Qiu wrote:
> > Because fsverity_descriptor_location.version is constant, so use macro
> > for better reading.
> >
> > Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> > ---
> >  fs/f2fs/verity.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c index
> > 865c9fb774fb..5be8a5790907 100644
> > --- a/fs/f2fs/verity.c
> > +++ b/fs/f2fs/verity.c
> > @@ -29,6 +29,8 @@
> >  #include "f2fs.h"
> >  #include "xattr.h"
> >
> > +#define F2FS_VERIFY_VER	cpu_to_le32(1)
> 
> Should be like this?
> 
> #define F2FS_VERITY_VER		1
> 
> And, use cpu_to_le32(F2FS_VERITY_VER) below?
> 

OK, I will revise this in next version, Thanks.

> > +
> >  static inline loff_t f2fs_verity_metadata_pos(const struct inode
> > *inode)  {
> >  	return round_up(inode->i_size, 65536); @@ -152,7 +154,7 @@ static
> > int f2fs_end_enable_verity(struct file *filp, const void *desc,
> >  	struct inode *inode = file_inode(filp);
> >  	u64 desc_pos = f2fs_verity_metadata_pos(inode) + merkle_tree_size;
> >  	struct fsverity_descriptor_location dloc = {
> > -		.version = cpu_to_le32(1),
> > +		.version = F2FS_VERIFY_VER,
> >  		.size = cpu_to_le32(desc_size),
> >  		.pos = cpu_to_le64(desc_pos),
> >  	};
> > @@ -199,7 +201,7 @@ static int f2fs_get_verity_descriptor(struct inode
> *inode, void *buf,
> >  			    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc), NULL);
> >  	if (res < 0 && res != -ERANGE)
> >  		return res;
> > -	if (res != sizeof(dloc) || dloc.version != cpu_to_le32(1)) {
> > +	if (res != sizeof(dloc) || dloc.version != F2FS_VERIFY_VER) {
> >  		f2fs_warn(F2FS_I_SB(inode), "unknown verity xattr format");
> >  		return -EINVAL;
> >  	}
> > --
> > 2.17.1
> >
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
