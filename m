Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E738D667C6C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jan 2023 18:20:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pG1FK-0007Gy-1y;
	Thu, 12 Jan 2023 17:20:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pG1FI-0007Gs-Ti
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 17:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E+c881Dpe/85Aq62y2qtNDOsySQkmPy3VHLSOKalLuM=; b=dt0DgHHh8y7qP1GfXVc1A+yDzN
 3hTns/qZObTW3VroEQJJRz2rEnJyMulYTa1cN7NsArX8djg83xsATX5PRIHGSIKSMeW4UwHMjRPLd
 a1LquH9AKMNq+ZWH9cI8UCzY4B+Hzs+Ynq9ceLfwuF0pn1EhBRdSXFMFbu+9jKjZVYtU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E+c881Dpe/85Aq62y2qtNDOsySQkmPy3VHLSOKalLuM=; b=RRpyf/PJDlLjF1EmDNYNKGOvG1
 TGwgb47v2VtxRUDraYQl/N+qBJY9/MfGcfb6S6PSPb5KsVfzXnX8WTZSucgvss6NTA1Q/eHVT3npe
 FfAP3k3wVEtVBh1ZqW/tKMJfOY3y4JycVBym7h6rMrEti4EnAtN/TPZ1tkIKBnjm7msE=;
Received: from mail-yb1-f176.google.com ([209.85.219.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pG1FG-0001ib-U2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 17:20:07 +0000
Received: by mail-yb1-f176.google.com with SMTP id v19so13613347ybv.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Jan 2023 09:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E+c881Dpe/85Aq62y2qtNDOsySQkmPy3VHLSOKalLuM=;
 b=Pc/Xg/kvl8DhMy2mV5DSv0JY0A6VI9FAm0F9VYc/dWZQyf9ydWoM7408OMWs2Kt4+S
 eCo3wgwd+MlvDDhfoUGkDIHkrJCrglJGkVPgM1Oz/eqrjqRxIUt6ATz63+Zu6orRFNgG
 FQGLvnnrHoT7dPPaTZzgvM7ZMRU4T4kxqvK2dz+jrBacryTz+KXjnEm1lE9Im5xoXhH6
 uaeXjEyPwqRZI6/5GVgzLBgcQ8qcs+by+yaLr7atp5Urs68114vwsX10TNqGRNH04pMs
 QclnYeakKcSogdPbUF9XgR9U7I3ZKCshjFY/gZue60/KZOW51I77izQ6dwI6z0pu5/hK
 x6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E+c881Dpe/85Aq62y2qtNDOsySQkmPy3VHLSOKalLuM=;
 b=S1WslS3/ZjTwTJIEg1L2DRjvxD2aArb851FPtZ6fJeai3+yd76XIKz213KrbDYDuhw
 4F5YhTaph9b62ECPOxHYCfzvHZmm5Jp52I2wnPWfDTMMZPG/SlMlLSzBq5SgPa7kYQAr
 lwt8X7wFR7BSFd6Crs/tj2VnmMKHeWHTF0VFK8uYTAgZaGl+HWZcY5wFTPsGnCcNTp4e
 jl7H1w5Ag8oO5XmjMTeB9axgiD/tIBSR6hkNqjGM4/Tl08v9aljNPC0NLHiXIpIkOlGB
 8hvwt3s+Ro4pPVj6MH6tfU7SyT3gi8weS/r9KoU6tfW8D0zYdF5Q4N4qRf0XVdPHRyDO
 IBZA==
X-Gm-Message-State: AFqh2koCTZTTAf6if49vnH+Rd8eFMdTZ5WB1y6/Fd0pWOjQs5Y7gLVg2
 e65y7HGDDv09yNZbOvPgqQ3hzE5xRAJtecMz1TQ=
X-Google-Smtp-Source: AMrXdXsAU7a6oM1sLrHI9+oxo29VzkKN9mlRylNCqKeDfYmz3uqWRlBtx5f1lx9/AgauD4UB5gGLFmj2h4TGKEvLRKQ=
X-Received: by 2002:a25:8a:0:b0:7ca:7f22:5c15 with SMTP id
 132-20020a25008a000000b007ca7f225c15mr196720yba.219.1673544001120; 
 Thu, 12 Jan 2023 09:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20230104211448.4804-1-vishal.moola@gmail.com>
 <20230104211448.4804-10-vishal.moola@gmail.com>
In-Reply-To: <20230104211448.4804-10-vishal.moola@gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 12 Jan 2023 09:19:50 -0800
Message-ID: <CAOzc2pw9WCgHyA2epbz5=HEWN4bFzD4C7zL2452J_egv7iSLrw@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org, pc@cjr.nz, tom@talpey.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 4, 2023 at 1:15 PM Vishal Moola (Oracle) wrote:
 > > This is in preparation for the removal of find_get_pages_range_tag().
 Now also > supports the use of large folios. > > Since tofind mi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.176 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pG1FG-0001ib-U2
Subject: Re: [f2fs-dev] [PATCH v5 09/23] cifs: Convert
 wdata_alloc_and_fillpages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 4, 2023 at 1:15 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> This is in preparation for the removal of find_get_pages_range_tag(). Now also
> supports the use of large folios.
>
> Since tofind might be larger than the max number of folios in a
> folio_batch (15), we loop through filling in wdata->pages pulling more
> batches until we either reach tofind pages or run out of folios.
>
> This function may not return all pages in the last found folio before
> tofind pages are reached.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/cifs/file.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index 22dfc1f8b4f1..8cdd2f67af24 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -2527,14 +2527,40 @@ wdata_alloc_and_fillpages(pgoff_t tofind, struct address_space *mapping,
>                           unsigned int *found_pages)
>  {
>         struct cifs_writedata *wdata;
> -
> +       struct folio_batch fbatch;
> +       unsigned int i, idx, p, nr;
>         wdata = cifs_writedata_alloc((unsigned int)tofind,
>                                      cifs_writev_complete);
>         if (!wdata)
>                 return NULL;
>
> -       *found_pages = find_get_pages_range_tag(mapping, index, end,
> -                               PAGECACHE_TAG_DIRTY, tofind, wdata->pages);
> +       folio_batch_init(&fbatch);
> +       *found_pages = 0;
> +
> +again:
> +       nr = filemap_get_folios_tag(mapping, index, end,
> +                               PAGECACHE_TAG_DIRTY, &fbatch);
> +       if (!nr)
> +               goto out; /* No dirty pages left in the range */
> +
> +       for (i = 0; i < nr; i++) {
> +               struct folio *folio = fbatch.folios[i];
> +
> +               idx = 0;
> +               p = folio_nr_pages(folio);
> +add_more:
> +               wdata->pages[*found_pages] = folio_page(folio, idx);
> +               folio_get(folio);
> +               if (++*found_pages == tofind) {
> +                       folio_batch_release(&fbatch);
> +                       goto out;
> +               }
> +               if (++idx < p)
> +                       goto add_more;
> +       }
> +       folio_batch_release(&fbatch);
> +       goto again;
> +out:
>         return wdata;
>  }
>
> --
> 2.38.1
>

Could someone review this cifs patch, please? This is one of the
2 remaining patches that need to be looked at in the series.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
