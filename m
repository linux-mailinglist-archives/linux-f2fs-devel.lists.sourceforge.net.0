Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DB7AAD6E3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 09:10:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srsDGc/DlCPMp0TFzUJst/uV8AJCyUhZxTzACxx4jPY=; b=HZNxaOOzRA/MFuCBshIitpv/j7
	8pS4IaAgZTWrs3ocLk67PACXhJk7NjU2+5QEsDD7RZ4cRFC04ZMA+rqpvVXCMHS1GsJv0N/+QOtmw
	6FSt102hcSR692uywf42vZ4fseUVVOfpD/G9k4eO86dDfJKN1LldDgGFmxFh0lGMz7QA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCYvA-0002Nh-3S;
	Wed, 07 May 2025 07:10:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uCYv8-0002N7-BU
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 07:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VPwga5KpIE2aVMvQjivhMpW7fXdT1gYlJZ1wQwuDdng=; b=hvNLT2s43lfcB+CZhPty3wRF6O
 xdiMfYv2YVdQn15q8URUuwpJh2fk96KQQuMhM5eFcSf2NirzQQo2Gfv1zpdgVShOIUhcymuGVmmb+
 S3SEfxgpRfVvStTCglh0YrznfqU12m7rkmpec4SrOmH4LKNxnefTPqzoXtVWWHZ8yqFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VPwga5KpIE2aVMvQjivhMpW7fXdT1gYlJZ1wQwuDdng=; b=ARwwCNT5SsarKajwOaapxAulvw
 g0xL9m3MWdrzgTaxcKb+5aBV13aQmM00HdQCWKlX1xOtZ7C8XXm5recVO+csKVUudLxAIjCK8CT8W
 b/Y8PWqDw1An1O59lZy9aVvX/NLob2/A87JTnLB9dJsLaIOOqx06d5/ys8Ab0nvvG7/U=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCYuo-0001xd-MV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 07:10:18 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 21B5F68B05; Wed,  7 May 2025 08:44:38 +0200 (CEST)
Date: Wed, 7 May 2025 08:44:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250507064437.GA31135@lst.de>
References: <20250505092613.3451524-1-hch@lst.de>
 <20250505092613.3451524-3-hch@lst.de>
 <aab08ad6-22db-44f3-9924-97e096cb0619@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aab08ad6-22db-44f3-9924-97e096cb0619@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 07, 2025 at 02:28:55PM +0800, Chao Yu wrote: >
 > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c > > index
 e016b0f96313..ce63b3bfb28f
 100644 > > --- a/fs/f2fs/compress.c > > +++ b/fs/ [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uCYuo-0001xd-MV
Subject: Re: [f2fs-dev] [PATCH 2/4] f2fs: don't return
 AOP_WRITEPAGE_ACTIVATE from f2fs_write_single_data_page
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 07, 2025 at 02:28:55PM +0800, Chao Yu wrote:
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index e016b0f96313..ce63b3bfb28f 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -1565,10 +1565,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
> >  						NULL, NULL, wbc, io_type,
> >  						compr_blocks, false);
> >  		if (ret) {
> > -			if (ret == AOP_WRITEPAGE_ACTIVATE) {
> > -				folio_unlock(folio);
> > -				ret = 0;
> 
> Previously, for this case, it will goto out label rather than writing
> left pages?

Indeed.  Is that the right thing to do here?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
