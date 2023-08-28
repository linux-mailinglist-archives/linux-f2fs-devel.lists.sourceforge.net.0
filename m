Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2F078BB69
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Aug 2023 01:18:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qalVV-0004sh-Pk;
	Mon, 28 Aug 2023 23:18:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <drosen@google.com>) id 1qalVU-0004sb-4x
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 23:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JQV2nCAbfwXToTPTG3Ur9b3WTFy0VHBgdGVl86NLDcA=; b=cbs+YuKEQtn1hHjjloyaY0H86Q
 YuohGeHC4wx7ScFPelNHsA6jcchix0U9/pz47O3XSbXiy3tGpe87MSY2QvIQMkslQ42e75hLFTPP4
 Uk4UdFuvX8EG7gE5S5g3siOEMJwR2zG5PkxjRiFLO2bM2qsZx7QJyqrljEu8l/3e/K+U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JQV2nCAbfwXToTPTG3Ur9b3WTFy0VHBgdGVl86NLDcA=; b=HdbY1Yv5XZjjAAljFYwio/zhCC
 J3t6jFGG4tpHtBEcidS2gAzs83N1JdsGuCnEvcWe0pfWD1X3VPH8z3pi5FQqHYEvENMf+8fgl4l2B
 1Xz+pqlQlSxUJ1qGZEMqrFqXaPCymwDSQkLUpfNrHltR2mlaBSmbtQZJVYJ0sWwBLJs4=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qalVP-0006Vw-N2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 23:18:52 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-3fef56f7248so35182115e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Aug 2023 16:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693264721; x=1693869521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JQV2nCAbfwXToTPTG3Ur9b3WTFy0VHBgdGVl86NLDcA=;
 b=lnbaQs74UlGBOnNNZX+z9YiTZfIPdGWgzlWUAU7ku5hRpAwHVe8vzEJJNTjpwCOeVi
 aJKvbsRKprlElUFAafzKuGqk107adXL7cs3jldV7sCHnRJ6VD3SycLHQSEdGzfgkcGMt
 VPBU220iO09ZCv7cMK+bk3kh5yWOiw79kItSdQfs6wZGk0f1t/5atQnR2CuY62ss6njy
 4kL8lW1OtCry4Cbtzj8mwxxqvlafAN/8poZU5KPIKigX8TW0Mdr+FjMI17xCq9ghBTPm
 RuC8W1VHoNAFKDnAlX5qG9ajtNXcBUwbJRQ681YrVybZ1GQn1BD7FDMwvsQPS/n4BEbF
 qgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693264721; x=1693869521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JQV2nCAbfwXToTPTG3Ur9b3WTFy0VHBgdGVl86NLDcA=;
 b=UXlquk2zatdgI9X6igGJmPJZY96ZjXkqwSwDGaZRID+EW0bqc1OLaTf9WjYJA0RoEO
 rePCTQrkuZYVEqQKt/XGQ4yKj4DrA9JjP1eXgMcC3Sbtagd5791j+8jGsfdZ3od0U6ni
 /sIfFZLIgy2FW+TJDpo+Q3ZcMVJFFCjvy98k1KtP33BOoU77ZCJamv8jww+9bmfdHt18
 /1kTh7EDfoE5hGrvv6YaiDh1UgfwWrlZk1BM11Nf6IdZdjkaX5THHMuJ/ePsQdWBEkPQ
 ksUcM9oSlrEMRJdZFdg4Rx356/4oPFZb1RJkoy7r+UgvxfKe1FB/3cv9Sv915+VzcRiZ
 mHjQ==
X-Gm-Message-State: AOJu0YwGX0CcgsWEVeNriiCf7XsJtc6fHss6zpLzQgelotGw3nfsI2It
 2SCz1oDppnljp347iZTy0Ks5NgqSp64nauQlmdbaSOyusw9/sU8oElqDWw==
X-Google-Smtp-Source: AGHT+IE9mWbs9XjUO+5jdK88J7jGDGT2/o1TZAPa4JkYYYURZKTtV3BIKwYMdmpjtgsxFJG/MVHfoeHIYCquAJjbpgY=
X-Received: by 2002:adf:f08b:0:b0:315:a32d:311f with SMTP id
 n11-20020adff08b000000b00315a32d311fmr20878375wro.14.1693264721059; Mon, 28
 Aug 2023 16:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230825224400.2206278-1-drosen@google.com>
 <20230825224400.2206278-8-drosen@google.com>
 <ZO0DMFmiiULzfFQB@google.com>
In-Reply-To: <ZO0DMFmiiULzfFQB@google.com>
Date: Mon, 28 Aug 2023 16:18:30 -0700
Message-ID: <CA+PiJmT9M9i7ycWj+3JOjyuebbNdVOcYr4UE6e3=9BxVoRNMAg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Aug 28, 2023 at 1:27 PM Jaegeuk Kim <jaegeuk@kernel.org>
    wrote: > > This patch somehow reveals struct size assertions. > You can get
    it when running fsck from the used f2fs partition. > Seem [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.41 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.41 listed in wl.mailspike.net]
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qalVP-0006Vw-N2
Subject: Re: [f2fs-dev] [PATCH v2 7/7] f2fs-tools: Support different block
 sizes
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: kernel-team@android.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgMToyN+KAr1BNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBzb21laG93IHJldmVhbHMgc3RydWN0IHNp
emUgYXNzZXJ0aW9ucy4KPiBZb3UgY2FuIGdldCBpdCB3aGVuIHJ1bm5pbmcgZnNjayBmcm9tIHRo
ZSB1c2VkIGYyZnMgcGFydGl0aW9uLgo+ClNlZW1zIHRoZSBiaW5hcnkgSSB3YXMgdGVzdGluZyBo
YWQgdGhlIGFzc2VydHMgc2V0IHRvIG5vb3BzLiBJIHdhcwptaXNzaW5nIHRoZSAyIGJ5dGVzIGZy
b20gbl9uYXRzL25fc2l0cywgYW5kIGhhZCBhIGZldyBuYXQvc2l0cwp0cmFuc3Bvc2VkLi4uIEZp
eGVkIGZvciB2My4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
