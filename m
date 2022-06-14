Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C05F54B637
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 18:34:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o19UW-0004MX-Bx; Tue, 14 Jun 2022 16:34:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1o19UV-0004MR-3H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 16:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M/kEUFAftetAf2N7yHDHF4JNTzfknxIkkNoqCJfpWV0=; b=VMAGR6FWrssIRv1WVAhwKLWkSd
 +/2sUysPuPimgBuA76x/XkTolMRBZ82ANGpn9QBrS2En5YOm/Lcc6yZnMsRst7EcP/dGWwLVgKz1W
 384WV/AeuMMxi9LWtLqAodipVdO5gj9D9IiynqxCzu9JZbZ+U+8Sop6n86D36Xp80wi0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M/kEUFAftetAf2N7yHDHF4JNTzfknxIkkNoqCJfpWV0=; b=Sd6ZEjnhPBB++OcN5UZ6LOeW9B
 cqa4hyGl68gDEJFYep5ue+/2Oc7N09jo4RhrzxYRHPuNNDA5cfLQDCV+Mxwh++PTD25UDKofySp5T
 n7q1NGpQzXJZc905qVM/0K7EJca8ussR6pbCQtEkEzH3AKMLjdHXosHklV7iBddFiRDU=;
Received: from mail-yw1-f175.google.com ([209.85.128.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o19UQ-001ZfV-Dd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 16:34:05 +0000
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-30c2f288f13so35439277b3.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jun 2022 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M/kEUFAftetAf2N7yHDHF4JNTzfknxIkkNoqCJfpWV0=;
 b=bQFtbs9YcHpIat+VNMaXN8GfVHbAWCDLkV7fg62QD0yIWV+0uP3jDb6bxCYuRrqEKT
 khJU61Bk1hb9Uq80iBtZyGFkblrK2wmswiU0/MbDSWcgffqTKuIHptrGMxqOTMIqbcC5
 sHDPSHsiLF/+5qg30zLjsDKcgknLfGgW1u29wprNjV5IKExT0DSPvuMIv9W8cvVBEDsm
 5HJuDD1ugXa43hE611TnQppED/4xi7YH9Yfla859aTKuPPndKZGqDFWWurUyMgqK4jRr
 xL31Z0Afw/Y6Rb16m9Il0Mtp3STHc2r+MPEzB3OgRTSAFGzSzZ3IIs/HR0OlrSmV8qTK
 UyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/kEUFAftetAf2N7yHDHF4JNTzfknxIkkNoqCJfpWV0=;
 b=yZC2MbcuBgSVel9t3UzT55hFn8nWalKAq9V0mfqB4L3KT/xzSet6Jr3NAHaKFrdHGX
 sdbOQJovlKuK6zpyMYl+ixebYUr5QTh1jjE0a3ezqlnzjPLb56/duTEJSSTWOsJJMMiy
 vEgJmyt4r8R1u+z9BwH2EQ0Ks6hqCgox9sKdkZXBsEAsPVCZkXHoNiPdikzDSaa9ak+6
 35ul1zzrQ4w1MW2+cMdqxRhkvUtwmB67bigt5v+m7PR3iZLQYUy4rh+JxtBS4MLLVagl
 y8n3g8jMkbMJfmG6/6+t8S8g+1un6BKgb6Tryd5cDxnFT2+dQmJUyV9Ik3z5vOxfUHZZ
 hALA==
X-Gm-Message-State: AJIora8R3yN5WToAcYJqj/olmzuiblQo12fdU0RvOwLdLds8SCR05AH0
 85Pu3SjzvjPDlX0RC3qkRG8LL9o5msZk2lwoSLU=
X-Google-Smtp-Source: AGRyM1stOhRVUmqx6x88uP8qyvJLoxv+aOJ0qkV9zyqBCmiYqcqZF7JCtPygwqiVsQXO2FQ8S8R0hej7Hl8B6obkwRk=
X-Received: by 2002:a81:78d:0:b0:2e5:d440:d921 with SMTP id
 135-20020a81078d000000b002e5d440d921mr6236243ywh.251.1655224436611; Tue, 14
 Jun 2022 09:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220613155612.402297-1-daeho43@gmail.com>
 <Yqge0XS7jbSnNWvq@sol.localdomain>
In-Reply-To: <Yqge0XS7jbSnNWvq@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 14 Jun 2022 09:33:45 -0700
Message-ID: <CACOAw_xZvvJFC8OwDQibtXqyYS7bMRe8CVkkktT_Nd1_EtFw+g@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > One question: is this (the bio endio callback) actually
 guaranteed to be > executed from a softirq? If you look at dm-crypt's support
 for workqueue-less > decryption, for example, it explicitly chec [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1o19UQ-001ZfV-Dd
Subject: Re: [f2fs-dev] [PATCH] f2fs: handle decompress only post processing
 in softirq
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
Cc: Daeho Jeong <daehojeong@google.com>, Nathan Huckleberry <nhuck@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> One question: is this (the bio endio callback) actually guaranteed to be
> executed from a softirq?  If you look at dm-crypt's support for workqueue-less
> decryption, for example, it explicitly checks 'in_hardirq() || irqs_disabled()'
> and schedules a tasklet if either of those is the case.
>
> - Eric

Oh, you're right. Even though it's safe to defer all the release
process as a work in end_io function, it's better to check the
condition and process the release process right away if possible.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
