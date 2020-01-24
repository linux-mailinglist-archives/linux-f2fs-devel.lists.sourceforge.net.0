Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A871477DF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 06:16:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iurKG-0007JR-U2; Fri, 24 Jan 2020 05:16:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iurKF-0007JG-FY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 05:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YYL1XrIyjR544EAnIy43CmKHnObpFqcOhUKxoM4L9Ew=; b=jvTa8pmZoVCX+FBaO9qjqlxLcn
 GR60MDOsQvBRp2N/F83FsRn5VYpcxvlfdS30On6/JWB0mLhCqAx//zPMNUZ6wo9z4N3fJcsk+GOr9
 KjTJOItfiSP2U21j9pX3J7nLJvGqhqy+2v3Vx/eyaof3yb/bNcTEw+/uF23W4gpfrBEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YYL1XrIyjR544EAnIy43CmKHnObpFqcOhUKxoM4L9Ew=; b=EMFIgEzNk89W+JuFac7GohnXIK
 FPKXQDI3I07ThmXrkmc/xXziHWR11yo5CQOBswE3PnFjWriq/qlQeOGf6jds4HKhZt3kGHqPjE6JA
 7EMOA4154WbWTSZESYduvzHo0Xyq2WfLg5Gf+PHZFTGn7izSVALnBrUr32tgwhCib/Jk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iurKE-003Hby-9J
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 05:16:11 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BBDDF2071A;
 Fri, 24 Jan 2020 05:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579842963;
 bh=+bhb+s0f7B8ftjSnB2z/I4wHjcLdDMiVwk5zcTEu+Xg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XDHBOOKK9bkcNNfisMo8Nc3n1utEsOSFcTbo/UH7ZqTVyKMQuk6ACT1kRFMpzt8aB
 5j6gHRPkoqlU8SqTZZWXuXn9s/Hhoi+DtJXL/EC2pRIXpb26vbju+EHQM3laQjcWOM
 k7vSkMNunrddsoN4QHTjTyp+7TwQ5xYVI6swmAeo=
Date: Thu, 23 Jan 2020 21:16:01 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gao Xiang <hsiangkao@aol.com>
Message-ID: <20200124051601.GB832@sol.localdomain>
References: <20200124041234.159740-1-ebiggers@kernel.org>
 <20200124050423.GA31271@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124050423.GA31271@hsiangkao-HP-ZHAN-66-Pro-G1>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iurKE-003Hby-9J
Subject: Re: [f2fs-dev] [PATCH] ext4: fix race conditions in ->d_compare()
 and ->d_hash()
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
Cc: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 24, 2020 at 01:04:25PM +0800, Gao Xiang wrote:
> > diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
> > index 8964778aabefb..0129d14629881 100644
> > --- a/fs/ext4/dir.c
> > +++ b/fs/ext4/dir.c
> > @@ -671,9 +671,11 @@ static int ext4_d_compare(const struct dentry *dentry, unsigned int len,
> >  			  const char *str, const struct qstr *name)
> >  {
> >  	struct qstr qstr = {.name = str, .len = len };
> > -	struct inode *inode = dentry->d_parent->d_inode;
> > +	const struct dentry *parent = READ_ONCE(dentry->d_parent);
> 
> I'm not sure if we really need READ_ONCE d_parent here (p.s. d_parent
> won't be NULL anyway), and d_seq will guard all its validity. If I'm
> wrong, correct me kindly...
> 
> Otherwise, it looks good to me...
> Reviewed-by: Gao Xiang <gaoxiang25@huawei.com>
> 

While d_parent can't be set to NULL, it can still be changed concurrently.
So we need READ_ONCE() to ensure that a consistent value is used.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
