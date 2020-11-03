Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F82A3B02
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 04:23:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZmvF-0006u4-Sb; Tue, 03 Nov 2020 03:23:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kZmvE-0006tv-W5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 03:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nvt9duR7jYqFG+g62WemIliT+o+J6W+2Pycw4tig720=; b=EE3zX04xwaQeL+/+53DKE78eMv
 ooJpcQFJb6USve4uR9bY2E5RP5ciBxTsRXEdlRFIRw9vIydp/RmamGsz06OVvC/s3y1vTOnxc2GYP
 HrQlytdB4HkiHIBzei79d5Rtw6dPqA941is9TStnFFuzStIZIELk/8CbTyWRI87PHIns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nvt9duR7jYqFG+g62WemIliT+o+J6W+2Pycw4tig720=; b=RxcJOHkyX/9PD4pTnqB8tRMvzj
 oWpBlGhW8spd1Swff44sInVXwKt3CLrkmcK3O+AzDfDC5u1SjaUWdePzVBGxfBUf8GRIkay6XbQWd
 F/xS3713Nn7xGP1g80BwOxYrasKNLjdqj/Vw1un+PBUhpbEH0M4g6xczn3ByOz098+CA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZmv8-007Ecg-1x
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 03:23:48 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26346207BB;
 Tue,  3 Nov 2020 03:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604373809;
 bh=p9rQmVDxvvOszEjaGQDBK6m2fDZWjD12qwvk598JVQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=romb8T+KHa9yqXJuEAfFU3ZMyx5vMFDr8jG5yMmi3f1CJQh5/UdbHkmS8/wva9xGW
 FXqFwCR7K3E77PkmywIWEGD2zzhLB6FWqwJ7g1+vQdYKegYya+CnEinjvmEMDdpubY
 GFvyoxxslp+X639eSvUxjnlHalzaOr7kNDvcT9gQ=
Date: Mon, 2 Nov 2020 19:23:27 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20201103032327.GA3655802@google.com>
References: <20201026094000.1500425-1-robinhsu@google.com>
 <20201103025247.GA2875@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103025247.GA2875@sol.localdomain>
X-Spam-Score: -0.1 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZmv8-007Ecg-1x
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs-toos:fsck.f2fs Fix bad return value
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/02, Eric Biggers wrote:
> On Mon, Oct 26, 2020 at 05:40:00PM +0800, Robin Hsu via Linux-f2fs-devel wrote:
> > 'ret' should not have been used here: otherwise, it would be wrongly used
> > as the error code and then be returned from main().
> > 
> > Signed-off-by: Robin Hsu <robinhsu@google.com>
> > ---
> >  fsck/fsck.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > index f97e9fb..66e4e3f 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -3137,8 +3137,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
> >  		char ans[255] = {0};
> >  
> >  		printf("\nDo you want to restore lost files into ./lost_found/? [Y/N] ");
> > -		ret = scanf("%s", ans);
> > -		ASSERT(ret >= 0);
> > +		ASSERT(scanf("%s", ans) >= 0);
> >  		if (!strcasecmp(ans, "y")) {
> >  			for (i = 0; i < fsck->nr_nat_entries; i++) {
> >  				if (f2fs_test_bit(i, fsck->nat_area_bitmap))
> 
> This patch causes a compiler warning:
> 
> 	In file included from f2fs.h:33,
> 			 from fsck.h:14,
> 			 from fsck.c:11:
> 	fsck.c: In function 'fsck_verify':
> 	../include/f2fs_fs.h:197:11: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
> 	    printf("[ASSERT] (%s:%4d) " #exp"\n",  \
> 		   ^~~~~~~~~~~~~~~~~~~~
> 	fsck.c:3151:3: note: in expansion of macro 'ASSERT'
> 	   ASSERT(scanf("%s", ans) >= 0);
> 	   ^~~~~~

Urg. Fixed by this.

From c986140e3c5abb9eb7a08928a88acb8273f1bd52 Mon Sep 17 00:00:00 2001
From: Robin Hsu <robinhsu@google.com>
Date: Mon, 26 Oct 2020 17:40:00 +0800
Subject: [PATCH] f2fs-toos: fsck.f2fs Fix bad return value

'ret' should not have been used here: otherwise, it would be wrongly used
as the error code and then be returned from main().

Signed-off-by: Robin Hsu <robinhsu@google.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/fsck.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 647523397f3e..e52672032d2c 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3146,10 +3146,11 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 #ifndef WITH_ANDROID
 	if (nr_unref_nid && !c.ro) {
 		char ans[255] = {0};
+		int res;
 
 		printf("\nDo you want to restore lost files into ./lost_found/? [Y/N] ");
-		ret = scanf("%s", ans);
-		ASSERT(ret >= 0);
+		res = scanf("%s", ans);
+		ASSERT(res >= 0);
 		if (!strcasecmp(ans, "y")) {
 			for (i = 0; i < fsck->nr_nat_entries; i++) {
 				if (f2fs_test_bit(i, fsck->nat_area_bitmap))
-- 
2.29.1.341.ge80a0c044ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
