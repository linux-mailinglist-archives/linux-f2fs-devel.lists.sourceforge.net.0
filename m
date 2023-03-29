Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2194D6CF146
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Mar 2023 19:42:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phZoP-0000hJ-IF;
	Wed, 29 Mar 2023 17:42:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1phZoN-0000hC-Pe
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Mar 2023 17:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7pRW8ZygO7FUWeXFZhnZuyISfnteILKf1nQphP6NhE8=; b=hHbaR8AWDbbFEHQ4RJlsA0zQh8
 GVc65/ROvwdcksAwLKzUqDrpuiQDLjFxOhSZtRtRFp6YnujfBfswKN0d6osurUnA+ac6SgLu46p55
 u2aNg5IETJG9ljc6jBgHLywV7k9HxV6Nv4GFDcQEagSaZc+z/f5DWKM6fBGAaBd1TvtE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7pRW8ZygO7FUWeXFZhnZuyISfnteILKf1nQphP6NhE8=; b=CiqSkGa8ZKERMi6PRVlEZkeZpi
 Y9/iFc/wQx9UsC2qCiTLVTGWnFjtA0LTM0hbH5HC70DIjP+mPiecy/6orYsgLORhhJSOzf8lNEdcR
 +sF1sTydM9aqOuhGxwpjlLeDYekP93C6N2QxSrbHEis9RLV4mBew0i9BC39UPVGMh3J0=;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1phZoM-008dnw-OY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Mar 2023 17:42:16 +0000
Received: by mail-ed1-f51.google.com with SMTP id eh3so66429818edb.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Mar 2023 10:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1680111728; x=1682703728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7pRW8ZygO7FUWeXFZhnZuyISfnteILKf1nQphP6NhE8=;
 b=JxeH8MNLqBhIqISEzofqnZ89GLUuBa5KWxu3wPlB+gO1hj/KKWxYjOwuGxw/KfHhAF
 mZ/Ox5Ah5DAZyf6EQvGuoRCSWYnZv5Bd0BjrA4yZ4WSDWb1YzZP5RYYK485ui1Q++6Dy
 cZCVy9M6aNjqvY7wSBgYQU2IKJ3MbZchS2wsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680111728; x=1682703728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7pRW8ZygO7FUWeXFZhnZuyISfnteILKf1nQphP6NhE8=;
 b=NcAEwTyxH2PSmnhDqpP/4O6y4V3FXM3lRr/7PBPqkahkQXUMfOtjultcDISBpdhj0n
 zi066t9TXWQFwChAbIYa5KcSO0RekF6ccr1kCaksTWqB+Ez/en1n7f6TL4DdoATPUXtM
 YTFXi2MzYhqkRQNBbCUr+A7U8ulx4pFRLU/NYnyhuQ5/Qz5BDTvRog/SMCMm3rSorXB6
 kPfXqLtaZMDosegsz0Tx/uoLIHVzQRn5ynszHQb71PvAEiZIC7S6hBMJvV6N1ZMSzfJ4
 9H3lNwIQ/917DXpLvPc/Z6cGOFrUz/Wav4sLhk4JhFfoHjokgZjBNJUXS44Fvg8pNyQz
 uAtg==
X-Gm-Message-State: AAQBX9ckUd+3s3scXaKbPhH693bwsxAxiR10e8+kjMFToE4wecwRQ/mN
 4bUypmfnTlhBUTCIi+XaS7wMz4cmV+XBE3OpyQGskr/G
X-Google-Smtp-Source: AKy350bHy9SEleVqgWSh69unMlDX99BTtkSm8Z3L39xRbVKyhto6FnwLgchf9s0f27Jhu8Jw0nPybA==
X-Received: by 2002:a17:906:3449:b0:93b:b8f3:225d with SMTP id
 d9-20020a170906344900b0093bb8f3225dmr20433173ejb.15.1680111727963; 
 Wed, 29 Mar 2023 10:42:07 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 m27-20020a170906259b00b0093a3a663ebdsm11478437ejb.154.2023.03.29.10.42.07
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 10:42:07 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id b20so66548894edd.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Mar 2023 10:42:07 -0700 (PDT)
X-Received: by 2002:a17:906:2456:b0:8e5:411d:4d09 with SMTP id
 a22-20020a170906245600b008e5411d4d09mr10331819ejb.15.1680111726812; Wed, 29
 Mar 2023 10:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230306122549.236561-1-douglas.raillard@arm.com>
 <167821082479.1693.18260840022075703789.git-patchwork-notify@kernel.org>
 <20230328190306.3337b7b0@gandalf.local.home> <ZCOH9pc3hBKU3G3Z@google.com>
In-Reply-To: <ZCOH9pc3hBKU3G3Z@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 Mar 2023 10:41:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg=VDrd=kR7Q4DrvJ5yapinKfCmHiFSty3k5CTyawMmDg@mail.gmail.com>
Message-ID: <CAHk-=wg=VDrd=kR7Q4DrvJ5yapinKfCmHiFSty3k5CTyawMmDg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Mar 28, 2023 at 5:36 PM Jaegeuk Kim <jaegeuk@kernel.org>
    wrote: > > Thanks for heads-up. I sent a pull request having the above patch
    to Linus. .. and it's merged now. Linus 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.51 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.51 listed in list.dnswl.org]
X-Headers-End: 1phZoM-008dnw-OY
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix f2fs_truncate_partial_nodes ftrace
 event
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
Cc: patchwork-bot+f2fs@kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-f2fs-devel@lists.sourceforge.net,
 mhiramat@kernel.org, Douglas RAILLARD <douglas.raillard@arm.com>,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBNYXIgMjgsIDIwMjMgYXQgNTozNuKAr1BNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhhbmtzIGZvciBoZWFkcy11cC4gSSBzZW50IGEgcHVsbCBy
ZXF1ZXN0IGhhdmluZyB0aGUgYWJvdmUgcGF0Y2ggdG8gTGludXMuCgouLiBhbmQgaXQncyBtZXJn
ZWQgbm93LgoKICAgICAgICAgICAgICAgTGludXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
