Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 429911FF21F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 14:41:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jltrT-0008Qw-TF; Thu, 18 Jun 2020 12:41:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mstsxfx@gmail.com>) id 1jltrS-0008Qp-LZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 12:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GwWWgp6poedvgja7RNEoGmK1y3wNcNo/q/dYBmBGoA8=; b=eThLJiosy47nUvmCfCClabwtIE
 nOwEeWHfdRq/aCH7rlY2Wmvs7ZRwFeG7RON9AsAOKGak4xGlTzxi1mBubfnMm67Zys+rdHfMYWYKp
 DMmSSfcTE1Glm6uRqMdXxJgzG1RdFTBWCJ8BUPK5iN0w+vwIbyOzqFK4ErRmKsqfzh+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GwWWgp6poedvgja7RNEoGmK1y3wNcNo/q/dYBmBGoA8=; b=AvJgsnMRvhAxiMPgCePFvjbF0Q
 1CKCt8vGGxnyuxHeGKMH063YbMZlK5WJSgj35k+ZFv6IhByGJMIKj4hNnul0wYZqmQFCn9ZaUuQJ8
 IEMEZHA4pDobpzxwPp6foSgqxNROXebnIui5rcWWbQ1GtffrM3lJ81vl6dkKY4PtHR8w=;
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jltrO-00AdKA-Qz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 12:41:42 +0000
Received: by mail-ej1-f65.google.com with SMTP id y13so6264483eju.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jun 2020 05:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GwWWgp6poedvgja7RNEoGmK1y3wNcNo/q/dYBmBGoA8=;
 b=o8Q5YFs3f6LisejGlCl01tijlA25MeOxTC8dVUVLRxoDya4UFMVu6MKRnpBgGxJm0Z
 1ZGGzNr6w5Iixwd3T4f2R2yPOHClzxFTiU4G0CNy0kLpstQLz+URO67yU4y1KG6z38ez
 +JsYGcwmhOmkb/3FN/JfvVA+xlfbrFUclkqBThJRj+ov1thTkaivntxK0PaG+Nf0WKNo
 nBJx9CqMvCpH+nsisZnwukKuCijGkM8CGUDK1ecO1ktlu/tehqgXB1/NdT+/K0Ync429
 jpx/mTfAsdrFF+LN5SBFMpsaC1p5mxUjgRtNflaclrvzJGPMCfoqlvEbrkWQg15/FbVV
 rmDQ==
X-Gm-Message-State: AOAM531qpml/2r6dicAhlnwQoiS+/xvJj1GBK/7JVCTBgiO0DJQyJEPM
 yhS8DE9y8Xv9np5I3AT1vrE=
X-Google-Smtp-Source: ABdhPJxMkauDVQefVPuJ2qpFGMV+90HykPa5BpTmZw4DM3T8iphGnLowIDqJy/XvxbHN8BtR+7Sktg==
X-Received: by 2002:a17:907:20e5:: with SMTP id
 rh5mr3971654ejb.80.1592484092440; 
 Thu, 18 Jun 2020 05:41:32 -0700 (PDT)
Received: from localhost (ip-37-188-189-34.eurotel.cz. [37.188.189.34])
 by smtp.gmail.com with ESMTPSA id dn15sm2375487ejc.26.2020.06.18.05.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 05:41:31 -0700 (PDT)
Date: Thu, 18 Jun 2020 14:41:29 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Chris Down <chris@chrisdown.name>
Message-ID: <20200618124129.GC15447@dhcp22.suse.cz>
References: <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYsdsgRmwLtSKJSzB1eWcUQ1z-_aaU+BNcQpker34XT6_w@mail.gmail.com>
 <20200617135758.GA548179@chrisdown.name>
 <20200617141155.GQ9499@dhcp22.suse.cz>
 <CA+G9fYu+FB1PE0AMmE-9MrHpayE9kChwTyc3zfM6V83uQ0zcQA@mail.gmail.com>
 <20200617160624.GS9499@dhcp22.suse.cz>
 <CA+G9fYtCXrVGVtRTwxiqgfFNDDf_H4aNH=VpWLhsV4n_mCTLGg@mail.gmail.com>
 <20200617210935.GA578452@chrisdown.name>
 <CALOAHbBp7Ytd-Hta9NH-_HJtVTAsR5Pw2RYrVScp7PPezCEv2w@mail.gmail.com>
 <20200618123743.GA694719@chrisdown.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618123743.GA694719@chrisdown.name>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chrisdown.name]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.65 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mstsxfx[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jltrO-00AdKA-Qz
Subject: Re: [f2fs-dev] mm: mkfs.ext4 invoked oom-killer on i386 -
 pagecache_get_page
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
Cc: lkft-triage@lists.linaro.org, linux-mm <linux-mm@kvack.org>,
 Yafang Shao <laoar.shao@gmail.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Cgroups <cgroups@vger.kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, open list <linux-kernel@vger.kernel.org>,
 "Linux F2FS DEV, Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 18-06-20 13:37:43, Chris Down wrote:
> Yafang Shao writes:
> > On Thu, Jun 18, 2020 at 5:09 AM Chris Down <chris@chrisdown.name> wrote:
> > > 
> > > Naresh Kamboju writes:
> > > >After this patch applied the reported issue got fixed.
> > > 
> > > Great! Thank you Naresh and Michal for helping to get to the bottom of this :-)
> > > 
> > > I'll send out a new version tomorrow with the fixes applied and both of you
> > > credited in the changelog for the detection and fix.
> > 
> > As we have already found that the usage around memory.{emin, elow} has
> > many limitations, I think memory.{emin, elow} should be used for
> > memcg-tree internally only, that means they can only be used to
> > calculate the protection of a memcg in a specified memcg-tree but
> > should not be exposed to other MM parts.
> 
> I agree that the current semantics are mentally taxing and we should
> generally avoid exposing the implementation details outside of memcg where
> possible. Do you have a suggested rework? :-)

I would really prefer to do that work on top of the fixes we (used to)
have in mmotm (with the fixup).
-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
