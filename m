Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1F656B0BA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Jul 2022 04:50:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o9e4r-0007Hs-4k; Fri, 08 Jul 2022 02:50:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hughd@google.com>) id 1o9e4q-0007Hl-4r
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Jul 2022 02:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Message-ID:
 In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ad97sT16le5gjY7PgDU6gmeetvBzm9wlE8bQkILVjNc=; b=U0rsBiUfIo+rI6CeZoh/uIOn1Q
 ++61x3cUSzsEvjftGXf3ObtZVh23UfMKC0gD83CFTsTjRGcnMdw9lcZp5REuiRpF2juFlQYcGYoyc
 UKPPJNpHds693KYQXNu/tRWMNeG0PCtHcMemSmjr8ESgdjxP19vpd2I1Qjaw8KukjH8s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ad97sT16le5gjY7PgDU6gmeetvBzm9wlE8bQkILVjNc=; b=OEVphSf6YJjDjxDi0+GxtBlr1P
 KCgmdZy31+DsizFyr1m+EeFfnF219pAhsfJMZdU+315H472Ip27UN1I8EDQvDTaRXp7G73TepffUk
 L6bm0AYyWOh78xcsJbsdZuzKltIzOii3CXD8kE8H+NzAsV4TDyGDOHVMhRxaq00KGbWM=;
Received: from mail-qt1-f178.google.com ([209.85.160.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o9e4k-00AOqw-IC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Jul 2022 02:50:42 +0000
Received: by mail-qt1-f178.google.com with SMTP id y3so4544503qtv.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 07 Jul 2022 19:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=Ad97sT16le5gjY7PgDU6gmeetvBzm9wlE8bQkILVjNc=;
 b=tCcxRqjITVsiKb1O2qN38oOtehuQYEQmQlnA5EmpLLTcqVHGWkBNn5r6VjhB95uftz
 oBhwab0Wa2p2hfzUf6HitqoN4V8My4lx3Sr3LHdaGn7TrTI27nd6mE0wsQOIBv87ES7u
 uwlTgHRa2iafBHAxVTfOiHdPWVETU8CJjwRGskRUwQecY/1YbABG8fpWqJ0i5forgO17
 n0R7m15mcAmskoYtfNfHUvAotB5BgPlp6Llxsn+Fa0qYPR44yx2cfMCeEIswKRQZAgPI
 NLOhCVeNcKdBjtuIw/nnF9iOSfGliNNxy/YqmZphg0HMl4dZzroFochhJCRrtxDrneBV
 hZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=Ad97sT16le5gjY7PgDU6gmeetvBzm9wlE8bQkILVjNc=;
 b=Js/qt6072Ljq944RsvqT5mZZi4lDxQfeG39flHS7aEBYvufTEMvHYcHmWUkp2s8eLL
 FiOieI7ejypVQSbSBRH0TlwDOC4ZttybXrpF7OnayJeLVdvAZi18GIWPkWJZjSospF6z
 P8xPf6s+WOGG6ljAAHftX4kfvfbip6/RADbPVZ6DNLBqIM0DjCtvQU5pOHHv5ueNyo5t
 SeRfI+3LPsYV3Q84hQRk9XgZ7o1ZDWzEQz9qAmQms3Q6pdTmz9c/gA21ePgoTX7OJn9C
 uc1V+A18fQV4ZeOdzdW1JF0DPLRRxLB30flJnQPd4kwDffIJPXdua4nl7zn71tBdvKp9
 J3Jw==
X-Gm-Message-State: AJIora9R8kP/Xb7YwYLCnI8nLmQNZYJU6fpl5bqWNV+trqFB+jRtf5Pl
 rnglnQBDtk8la5ldI+VJJ3XErA==
X-Google-Smtp-Source: AGRyM1tJqq+vsbrqVwAmw8UZQYXdEmN7Cq4ADeDpayYOUxqHMEno4PbopiKhNsYF91bJVygTm51HMQ==
X-Received: by 2002:ac8:7d52:0:b0:319:51f0:e418 with SMTP id
 h18-20020ac87d52000000b0031951f0e418mr1088284qtb.481.1657248632632; 
 Thu, 07 Jul 2022 19:50:32 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a05620a254700b006a65c58db99sm35676841qko.64.2022.07.07.19.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 19:50:32 -0700 (PDT)
Date: Thu, 7 Jul 2022 19:50:17 -0700 (PDT)
X-X-Sender: hugh@ripple.anvils
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
In-Reply-To: <20220608150249.3033815-8-willy@infradead.org>
Message-ID: <6e7599d1-8a5f-bf16-383c-febd753bd051@google.com>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-8-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 8 Jun 2022, Matthew Wilcox (Oracle) wrote: > Now that
 both callers have a folio, convert this function to > take a folio & rename
 it. > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> >
 Reviewed-by: Christoph Hellwig <hch@lst.de [...] 
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.178 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1o9e4k-00AOqw-IC
Subject: Re: [f2fs-dev] [PATCH v2 07/19] mm/migrate: Convert
 expected_page_refs() to folio_expected_refs()
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
From: Hugh Dickins via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hugh Dickins <hughd@google.com>
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 8 Jun 2022, Matthew Wilcox (Oracle) wrote:

> Now that both callers have a folio, convert this function to
> take a folio & rename it.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/migrate.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 2975f0c4d7cf..2e2f41572066 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -336,13 +336,18 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
>  }
>  #endif
>  
> -static int expected_page_refs(struct address_space *mapping, struct page *page)
> +static int folio_expected_refs(struct address_space *mapping,
> +		struct folio *folio)
>  {
> -	int expected_count = 1;
> +	int refs = 1;
> +	if (!mapping)
> +		return refs;
>  
> -	if (mapping)
> -		expected_count += compound_nr(page) + page_has_private(page);
> -	return expected_count;
> +	refs += folio_nr_pages(folio);
> +	if (folio_get_private(folio))
> +		refs++;
> +
> +	return refs;
>  }
>  
>  /*
> @@ -359,7 +364,7 @@ int folio_migrate_mapping(struct address_space *mapping,
>  	XA_STATE(xas, &mapping->i_pages, folio_index(folio));
>  	struct zone *oldzone, *newzone;
>  	int dirty;
> -	int expected_count = expected_page_refs(mapping, &folio->page) + extra_count;
> +	int expected_count = folio_expected_refs(mapping, folio) + extra_count;
>  	long nr = folio_nr_pages(folio);
>  
>  	if (!mapping) {
> @@ -669,7 +674,7 @@ static int __buffer_migrate_folio(struct address_space *mapping,
>  		return migrate_page(mapping, &dst->page, &src->page, mode);
>  
>  	/* Check whether page does not have extra refs before we do more work */
> -	expected_count = expected_page_refs(mapping, &src->page);
> +	expected_count = folio_expected_refs(mapping, src);
>  	if (folio_ref_count(src) != expected_count)
>  		return -EAGAIN;
>  
> -- 
> 2.35.1

This commit (742e89c9e352d38df1a5825fe40c4de73a5d5f7a in pagecache.git
folio/for-next and recent linux-next) is dangerously wrong, at least
for swapcache, and probably for some others.

I say "dangerously" because it tells page migration a swapcache page
is safe for migration when it certainly is not.

The fun that typically ensues is kernel BUG at include/linux/mm.h:750!
put_page_testzero() VM_BUG_ON_PAGE(page_ref_count(page) == 0, page),
if CONFIG_DEBUG_VM=y (bisecting for that is what brought me to this).
But I guess you might get silent data corruption too.

I assumed at first that you'd changed the rules, and were now expecting
any subsystem that puts a non-zero value into folio->private to raise
its refcount - whereas the old convention (originating with buffer heads)
is that setting PG_private says an extra refcount has been taken, please
call try_to_release_page() to lower it, and maybe that will use data in
page->private to do so; but page->private free for the subsystem owning
the page to use as it wishes, no refcount implication.  But that you
had missed updating swapcache.

So I got working okay with the patch below; but before turning it into
a proper patch, noticed that there were still plenty of other places
applying the test for PG_private: so now think that maybe you set out
with intention as above, realized it wouldn't work, but got distracted
before cleaning up some places you'd already changed.  And patch below
now goes in the wrong direction.

Or maybe you didn't intend any change, but the PG_private test just got
missed in a few places.  I don't know, hope you remember, but current
linux-next badly inconsistent.
Over to you, thanks,

Hugh

--- a/mm/migrate.c	2022-07-06 14:24:44.499941975 -0700
+++ b/mm/migrate.c	2022-07-06 15:49:25.000000000 -0700
@@ -351,6 +351,10 @@ unlock:
 }
 #endif
 
+static inline bool folio_counted_private(struct folio *folio)
+{
+	return !folio_test_swapcache(folio) && folio_get_private(folio);
+}
 static int folio_expected_refs(struct address_space *mapping,
 		struct folio *folio)
 {
@@ -359,7 +363,7 @@ static int folio_expected_refs(struct ad
 		return refs;
 
 	refs += folio_nr_pages(folio);
-	if (folio_get_private(folio))
+	if (folio_counted_private(folio))
 		refs++;
 
 	return refs;
--- a/mm/vmscan.c	2022-07-06 14:24:44.531942217 -0700
+++ b/mm/vmscan.c	2022-07-06 15:49:37.000000000 -0700
@@ -2494,6 +2494,10 @@ shrink_inactive_list(unsigned long nr_to
  * The downside is that we have to touch folio->_refcount against each folio.
  * But we had to alter folio->flags anyway.
  */
+static inline bool folio_counted_private(struct folio *folio)
+{
+	return !folio_test_swapcache(folio) && folio_get_private(folio);
+}
 static void shrink_active_list(unsigned long nr_to_scan,
 			       struct lruvec *lruvec,
 			       struct scan_control *sc,
@@ -2538,8 +2542,9 @@ static void shrink_active_list(unsigned
 		}
 
 		if (unlikely(buffer_heads_over_limit)) {
-			if (folio_get_private(folio) && folio_trylock(folio)) {
-				if (folio_get_private(folio))
+			if (folio_counted_private(folio) &&
+			    folio_trylock(folio)) {
+				if (folio_counted_private(folio))
 					filemap_release_folio(folio, 0);
 				folio_unlock(folio);
 			}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
