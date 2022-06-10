Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 013A75459E8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jun 2022 04:05:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nzU1x-0002UI-GE; Fri, 10 Jun 2022 02:05:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pcc@google.com>) id 1nzU1v-0002UB-G6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 02:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n57nr6XvMdJpxicbPpvMv1otkew923DBxYjQi2K7qUo=; b=ZC0D7Y6pxh6Gxhyl5Csil5wHhY
 9Je7zZr/6TJQa6MIzej4aTN+p5fWR6A6T10aMREsomi6rJaUnte4VzpOICjBEJbXoeCJZRXeUDPwS
 IS2DZLFnV3Bp0s84JcmDAPx1xun1HBRQUc0Ww2R02kw1CvO/n8Aay5m8XNQlFpjslb4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n57nr6XvMdJpxicbPpvMv1otkew923DBxYjQi2K7qUo=; b=HO8FfUsY63MwAJn6xzVeB9mBgL
 jGhILw3bZKqcj0Xo2VVLU5MburEiPxy4oZyZW+A7KQ1OxTdXMcEj5UU2D3kUChTWOG0/yAwVO6Jpo
 /iTqRSz/NJ98dsS8K9HhQDtjoYG+jpWtmAE0Xm7+Ryk6I8BBVxgk/AZad4Aoz6vdmRbM=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nzU1l-0000Q7-6R
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 02:05:38 +0000
Received: by mail-pf1-f180.google.com with SMTP id bo5so22626247pfb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jun 2022 19:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n57nr6XvMdJpxicbPpvMv1otkew923DBxYjQi2K7qUo=;
 b=gMH0gDr0I7xPrs8FeEhmk3hMquAIQFRgB1/p98W3lXBz6vM1WHDXYi9TTXBsMY1F4J
 HB9d+tSwLhZFDR6DoSW078blLsiAXc1sJuW+FmrVqD3IcTj12YUL155sqaBiyvLL25Nw
 OdG4UjYH+tGO8U1NOYueRZSY+9LEDR4ZdpkhUyElm9hoIDpEqv++rWsizGFlwUGqtCDr
 U1iNz8TuJf6J3hQ9PxLqfKasQ5s/6Zs5zDn0QONvTYV+UeOni3Gx+IGHc0u1DvjI6gCE
 JbIC5VaHaHaohUBzL/WkvOvdXk3Ne1+rlTwtNhSIP1TGHEfGOU4PlbqkFoqTCGqqwbet
 qWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n57nr6XvMdJpxicbPpvMv1otkew923DBxYjQi2K7qUo=;
 b=VEDKC7bk2KXz/mZcNG/FDFrPD0FvdyZkpEPtRU+lYsMtK8kCVN5Pc9ZWbza80gjd7Z
 R00c5pENQlhJAkmTYflGeS1kIJITXQ9NmUTzi4642fdADUXmlUUmtJv9tl3E8z7flAuF
 rnFrvNu4+B2kDdkQqpsNJWWkZygrrGrI7H0e1epoBq1yUUjlnPLFlg8XSLnxY2jgulHY
 vPes/BujxgOWQUYRLSySVe+8WwcTW5oXDRiYKf3nCjQX+UJnLieEzwg35I12VQaZKeZC
 UJAv9wZJLZ/j4nE7CCnQ1BDARiXtES5iNGbc0f8lNw1kxP/jcqY+naQqWn+wuGh/4Vdh
 0I4Q==
X-Gm-Message-State: AOAM531X0X9dXg3NoUlAMrz2BP5crzCVobWLYLhwxcQ7JdCTkzygRaqP
 FjeGR8pdW/LEFjpUgJnk5ad/Jw==
X-Google-Smtp-Source: ABdhPJwAAtd3kXYLmu62odbljX5kVxmxdSOL3Li5NYMED1QOfHSdcheJwTPGwKKn2NvkOtARSpyF5A==
X-Received: by 2002:a63:6cc8:0:b0:3fa:387b:3991 with SMTP id
 h191-20020a636cc8000000b003fa387b3991mr37358742pgc.19.1654826728645; 
 Thu, 09 Jun 2022 19:05:28 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:fe27:a345:bcb1:755e])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a62e20f000000b0051bac6d2603sm17846748pfi.214.2022.06.09.19.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 19:05:27 -0700 (PDT)
Date: Thu, 9 Jun 2022 19:05:23 -0700
To: Bart Van Assche <bvanassche@acm.org>
Message-ID: <YqKm4wa31ygW8+Ra@google.com>
References: <20220421221836.3935616-1-bvanassche@acm.org>
 <20220421221836.3935616-11-bvanassche@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220421221836.3935616-11-bvanassche@acm.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Bart, On Thu, Apr 21, 2022 at 03:18:15PM -0700, Bart Van
 Assche wrote: > +static_assert(sizeof(struct f2fs_dentry_block) == 4096,
 ""); I noticed that this static_assert fails when PAGE_SIZE is defined to
 a value other than 4096. 
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.180 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1nzU1l-0000Q7-6R
Subject: Re: [f2fs-dev] [PATCH 10/31] Verify structure sizes at compile time
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
From: Peter Collingbourne via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Peter Collingbourne <pcc@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Bart,

On Thu, Apr 21, 2022 at 03:18:15PM -0700, Bart Van Assche wrote:
> +static_assert(sizeof(struct f2fs_dentry_block) == 4096, "");

I noticed that this static_assert fails when PAGE_SIZE is defined to
a value other than 4096.

I have to admit to being unfamiliar with f2fs. Is this an on-disk
data structure? If so, does it mean that non-4K page size kernels
are unable to mount f2fs file systems if the f2fs-tools were not
built with a matching PAGE_SIZE define?

In any event, maybe s/4096/PAGE_SIZE/g above is the correct fix
for now?

Peter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
