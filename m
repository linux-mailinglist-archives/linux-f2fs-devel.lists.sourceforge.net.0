Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB252A6D34
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Nov 2020 19:53:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kaNuk-0005W4-D0; Wed, 04 Nov 2020 18:53:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kaNui-0005Vn-Ky
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Nov 2020 18:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U4x1MXz5tbIvT1cORoWiOryU1faGGNbGUjdU+7mF3HQ=; b=Nxfzho2ix5jMkNJcBrrwFsoVyc
 Gw+i+IYxKpWMR1bsp/fw1mnZWc/n6jgr/rjv0QsvPerGYXB9xz/jMxxxuUShSxmCoV2resEffnP3l
 vsQlhWLY+l8tRS3Ghc+UCujyBDhkl3/7oyY5jMaRINcKLDUdew8F/d84hcZFr/ke3WGE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U4x1MXz5tbIvT1cORoWiOryU1faGGNbGUjdU+7mF3HQ=; b=HDL+rJaNZwvkRtXoIA3dvXYDyF
 icmuRlhDknBOPTePQMzzV7lZ1WyYFk2SRReNPA9ZiXLWEaSNwj22e+Z1/GOtQ5sYGpZdwclTq8WhJ
 3RzR3PDj5TLeQLYWLhTU0k5yrdpem0seItQmBIKVFHsCit7NnWRd1sixEtmBfX8ueXJg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kaNuR-009XjY-AB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Nov 2020 18:53:44 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6FA6320782;
 Wed,  4 Nov 2020 18:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604515994;
 bh=gmgwXt+wYX0tzEd4eikIaskpTiv2GPG3uhFSrn8iPa0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q24jLDweh2NM6hfE1ZDGJZmSgFQtFBUHeCWTOyKy2wCxzd2okKBB826gYkGDpJ5i7
 nyW2NRXYEONX+uznTSpTpBJxfBoEUyHhzyxVXDc1/Yf9wR9RWYJFj3J0PRhkh8X6Wl
 A9+OR6DyHKfLwhgovtxd9o+wZUYYkEZ0GxUXztNY=
Date: Wed, 4 Nov 2020 10:53:12 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Robin Hsu <robinhsu@google.com>
Message-ID: <20201104185312.GA134770@google.com>
References: <20201026094000.1500425-1-robinhsu@google.com>
 <20201103025247.GA2875@sol.localdomain>
 <20201103032327.GA3655802@google.com>
 <CAH7-xNRd1QBJUaxajijjrMbWdKKO1AKS2-1Q5HAAkHSUF628ug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH7-xNRd1QBJUaxajijjrMbWdKKO1AKS2-1Q5HAAkHSUF628ug@mail.gmail.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kaNuR-009XjY-AB
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/04, Robin Hsu wrote:
> The root cause is the ASSERT() marco,  In fact, I already fixed it in one
> of my recent work.
> I separate it as an independent commit here:
> 
> >From 5359588b1804c5e555e9fad92203d76041ef09eb Mon Sep 17 00:00:00 2001
> 
> From: Robin Hsu <robinhsu@google.com>
> 
> Date: Wed, 4 Nov 2020 10:50:28 +0800
> 
> Subject: [PATCH] Fix ASSERT() macro with '%' in the expression
> 
> 
> 
> Fix a compiling error triggered by ASSERT(exp), when exp contains '%'
> 
> (e.g. integer modular operator)
> 
> 
> 
> Signed-off-by: Robin Hsu <robinhsu@google.com>
> 
> Change-Id: I84708dbaf10c675b9950926c9b6ded5b5a3fbd59

Thanks, applied as well. :)

> 
> ---
> 
>  include/f2fs_fs.h | 4 ++--
> 
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> 
> 
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> 
> index b5bda13..1348e39 100644
> 
> --- a/include/f2fs_fs.h
> 
> +++ b/include/f2fs_fs.h
> 
> @@ -194,8 +194,8 @@ static inline uint64_t bswap_64(uint64_t val)
> 
>  #define ASSERT(exp)                                                    \
> 
>         do {                                                            \
> 
>                 if (!(exp)) {                                           \
> 
> -                       printf("[ASSERT] (%s:%4d) " #exp"\n",           \
> 
> -                                       __func__, __LINE__);            \
> 
> +                       printf("[ASSERT] (%s:%4d) %s\n",                \
> 
> +                                       __func__, __LINE__, #exp);      \
> 
>                         exit(-1);                                       \
> 
>                 }                                                       \
> 
>         } while (0)
> 
> --
> 
> 2.29.1.341.ge80a0c044ae-goog
> 
> 
> On Tue, Nov 3, 2020 at 11:23 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> 
> > On 11/02, Eric Biggers wrote:
> > > On Mon, Oct 26, 2020 at 05:40:00PM +0800, Robin Hsu via Linux-f2fs-devel
> > wrote:
> > > > 'ret' should not have been used here: otherwise, it would be wrongly
> > used
> > > > as the error code and then be returned from main().
> > > >
> > > > Signed-off-by: Robin Hsu <robinhsu@google.com>
> > > > ---
> > > >  fsck/fsck.c | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >
> > > > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > > > index f97e9fb..66e4e3f 100644
> > > > --- a/fsck/fsck.c
> > > > +++ b/fsck/fsck.c
> > > > @@ -3137,8 +3137,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
> > > >             char ans[255] = {0};
> > > >
> > > >             printf("\nDo you want to restore lost files into
> > ./lost_found/? [Y/N] ");
> > > > -           ret = scanf("%s", ans);
> > > > -           ASSERT(ret >= 0);
> > > > +           ASSERT(scanf("%s", ans) >= 0);
> > > >             if (!strcasecmp(ans, "y")) {
> > > >                     for (i = 0; i < fsck->nr_nat_entries; i++) {
> > > >                             if (f2fs_test_bit(i,
> > fsck->nat_area_bitmap))
> > >
> > > This patch causes a compiler warning:
> > >
> > >       In file included from f2fs.h:33,
> > >                        from fsck.h:14,
> > >                        from fsck.c:11:
> > >       fsck.c: In function 'fsck_verify':
> > >       ../include/f2fs_fs.h:197:11: warning: format '%s' expects a
> > matching 'char *' argument [-Wformat=]
> > >           printf("[ASSERT] (%s:%4d) " #exp"\n",  \
> > >                  ^~~~~~~~~~~~~~~~~~~~
> > >       fsck.c:3151:3: note: in expansion of macro 'ASSERT'
> > >          ASSERT(scanf("%s", ans) >= 0);
> > >          ^~~~~~
> >
> > Urg. Fixed by this.
> >
> > From c986140e3c5abb9eb7a08928a88acb8273f1bd52 Mon Sep 17 00:00:00 2001
> > From: Robin Hsu <robinhsu@google.com>
> > Date: Mon, 26 Oct 2020 17:40:00 +0800
> > Subject: [PATCH] f2fs-toos: fsck.f2fs Fix bad return value
> >
> > 'ret' should not have been used here: otherwise, it would be wrongly used
> > as the error code and then be returned from main().
> >
> > Signed-off-by: Robin Hsu <robinhsu@google.com>
> > Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fsck/fsck.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > index 647523397f3e..e52672032d2c 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -3146,10 +3146,11 @@ int fsck_verify(struct f2fs_sb_info *sbi)
> >  #ifndef WITH_ANDROID
> >         if (nr_unref_nid && !c.ro) {
> >                 char ans[255] = {0};
> > +               int res;
> >
> >                 printf("\nDo you want to restore lost files into
> > ./lost_found/? [Y/N] ");
> > -               ret = scanf("%s", ans);
> > -               ASSERT(ret >= 0);
> > +               res = scanf("%s", ans);
> > +               ASSERT(res >= 0);
> >                 if (!strcasecmp(ans, "y")) {
> >                         for (i = 0; i < fsck->nr_nat_entries; i++) {
> >                                 if (f2fs_test_bit(i,
> > fsck->nat_area_bitmap))
> > --
> > 2.29.1.341.ge80a0c044ae-goog
> >
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
