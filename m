Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 327552A3AA2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 03:53:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZmRh-0005kL-Q5; Tue, 03 Nov 2020 02:53:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kZmRf-0005kD-Lm
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 02:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cl6G3MtZdI2Ubeot9FVAVdjg8hC/Mlz9CnLaULRk78g=; b=hQkLpdPW1DT0mu9J1Mj/vn4jfk
 63c9qkgKffkhBS0K4nCFqt5JkiqYXsIt1fq8LC/TeNxNT/zD9K/pWLgBxICv0kp4x2Sgl49IN5glp
 XuENHDAUCkSha+ejUfVNs1cTStpdbtbA5L+bckWw5TidTfCzyS7ddUHq57CgMBIZNt7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cl6G3MtZdI2Ubeot9FVAVdjg8hC/Mlz9CnLaULRk78g=; b=OgFQu8p7FRqafPpHtYr5+ic+HH
 EZKjdZMwqFAOnocTyCbplwdVljBPXVn4d91isTK+wkNfcVP+6IuDnfEvcNGs38ltMwmcGU7yNyjsA
 GFsjAHt58iElspmgOfBWk2kqTC1+juPhWMfg18nl94tb7PtO2mt4x70tg2DupG69ePV8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZmRR-00H46W-Lt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 02:53:15 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD91122275;
 Tue,  3 Nov 2020 02:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604371968;
 bh=i6IyOgCMzRWTKNhC5dgaZ4TTYmnKxd5SmoeXUWUlkwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qTdLaUHI838Jt8XGj1TXxWzCHg/MAbW0kmWL3BlHJNpAOxAfu/SohmpbfnA8WhA+e
 bNt85xLEci+pfIXtTBPRArCfASlHjalW50XwJGmGXvdU7Xh34SjNnT3bQQVQY7tKuW
 sv2gU8ga44TvH5fPLYMK9kNsBxEDWM6lqyeLDcMQ=
Date: Mon, 2 Nov 2020 18:52:47 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Robin Hsu <robinhsu@google.com>
Message-ID: <20201103025247.GA2875@sol.localdomain>
References: <20201026094000.1500425-1-robinhsu@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026094000.1500425-1-robinhsu@google.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZmRR-00H46W-Lt
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 26, 2020 at 05:40:00PM +0800, Robin Hsu via Linux-f2fs-devel wrote:
> 'ret' should not have been used here: otherwise, it would be wrongly used
> as the error code and then be returned from main().
> 
> Signed-off-by: Robin Hsu <robinhsu@google.com>
> ---
>  fsck/fsck.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index f97e9fb..66e4e3f 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -3137,8 +3137,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>  		char ans[255] = {0};
>  
>  		printf("\nDo you want to restore lost files into ./lost_found/? [Y/N] ");
> -		ret = scanf("%s", ans);
> -		ASSERT(ret >= 0);
> +		ASSERT(scanf("%s", ans) >= 0);
>  		if (!strcasecmp(ans, "y")) {
>  			for (i = 0; i < fsck->nr_nat_entries; i++) {
>  				if (f2fs_test_bit(i, fsck->nat_area_bitmap))

This patch causes a compiler warning:

	In file included from f2fs.h:33,
			 from fsck.h:14,
			 from fsck.c:11:
	fsck.c: In function 'fsck_verify':
	../include/f2fs_fs.h:197:11: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
	    printf("[ASSERT] (%s:%4d) " #exp"\n",  \
		   ^~~~~~~~~~~~~~~~~~~~
	fsck.c:3151:3: note: in expansion of macro 'ASSERT'
	   ASSERT(scanf("%s", ans) >= 0);
	   ^~~~~~


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
