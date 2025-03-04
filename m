Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6E2A4EB59
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Mar 2025 19:24:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpWvx-0004HW-3Q;
	Tue, 04 Mar 2025 18:24:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tpWvv-0004HO-So
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 18:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UTvXX8sSlYolu/q7NpQQdlJiEqFKcsD2LSJ4GjwRKNM=; b=H9hMbcBQY2uScyFarrqaR7aJN7
 CjoJJ6u16RyznTybZ9doWomHkX2FblJpzAEQpZtkWpS9KOfQh8+u/sH2xaPfCbmCi3JRHnCumbVF3
 zFS1omTQq8vvQUpP1NfgG3RlvoARZ/xMyx6aBzbQQ28Ew0XMvq0tVfIOfNdieKqrEqjM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UTvXX8sSlYolu/q7NpQQdlJiEqFKcsD2LSJ4GjwRKNM=; b=V54azuPuD0k34hMOEYDBEewkfI
 JYJzGltA3XLhZtqbdQ2U+09KYSYTweq65agkyCZkxMdPpU2HMfVSu+vIzDOdgs1JdZ31PQ1vCAqCR
 3wbHLzCpEwUGTArOJOE3uJVUuBgO5n7jtDybZE5fE2aPux1AwF0c5kPWfBbGBLMAucNk=;
Received: from mail-ua1-f54.google.com ([209.85.222.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tpWvp-0007vQ-KY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 18:23:59 +0000
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-86b3bd4d0faso2164853241.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Mar 2025 10:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741112628; x=1741717428; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UTvXX8sSlYolu/q7NpQQdlJiEqFKcsD2LSJ4GjwRKNM=;
 b=U4Z8vDMZymSRD6AnlFqMryCUpeKpSoY+9fQsKKBfSGSychHjGc101e8JLKcTavgTLF
 bjVVpFXy0oMuWMJCsiB6pV2DRwkhQkxNjU8QswLQtXWZt2Bl+cgeS0s+jdGi2uTX18Ut
 rsa58k1mYJh9RHSiDxghkrGKZLLxSxjY56DNHJaM6whtFNViGoW461HD/oD2elMU1OEa
 Fvg+6xrwUx2qDQCO+jR3P4kFf7GjnR0RVHS7iZmrF+rYxNxAV3pdbwb6nCLX3SJYUHxc
 M0pHncLmYrtZ5lxahgdpUkPka+f3NlVT1wcRaiQijAVh91aWnBk3Vqj1IFP1Ug9CQ3Dq
 o8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741112628; x=1741717428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UTvXX8sSlYolu/q7NpQQdlJiEqFKcsD2LSJ4GjwRKNM=;
 b=tdbPQc0LLT6r3zIuDpP2eyMxadPwnWoPKk5sjoMdp/st/LBsYVdy+WHNzVqNq37qVu
 zu9kJvQ6cIeMvrcZJPFflsT4VBVAualw4sITyZFCygQc2wUlE8nNriP6KKMP7jf9k/7B
 Iwe8q4sFeNPRoBazSgSrwBmNmV/z36roLXutHRsvJLepdpHxmzdIXXCDfDX+xn8klQXs
 I+HXm0Z4BSi253f9LeWnarPtPicbsQY9/13ZAdXfMoEEe/JeSk1s5LEEfMvpohhL0qBB
 SAcriKCau3wK8DXpyhUTNRtozXumB6OI8WlbAs7Y5l8DRaBZHVRZTmxxQ6XdlyqiV+1P
 xwOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsHMK9DMIkZeu6EdL8w1mZVM+rdtFQFdAgkxHJfOUm4Sjaf9GRZMryplLBMxseS/as2/0RwoCnFq5FTXkogBBQ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxaVqHw5+XHAcUx0SQbjrRMPC5vfIyzW7gy/PJCI/7zRjKiddYn
 TcEcStkdVy+L43ZFx9cg1GSwsJ/rmpMk+XjIUljYRAx4E//ndNlJpDwE+PA4lMfkvQ0B8NTWJIU
 DyMlt9150izd3vnRq1LrA9dshH+c=
X-Gm-Gg: ASbGnct6jkzH2Qn6x2pPj0+12EdYvv7PXWkDI0FPks0i3WmTuvoXf17cApGQfvlnef/
 EV59u87n0pXWFtmRuhK8giK7dkrmIHLtUWUxrXxL0rIAAsd6FVNA6M+zLKhCk+MJx/ukJxHfyKk
 zOs0rITuzfGhgCuqgIH2M+8J8SGwFSfnwZXz9bX+ukQExPn//mfXQogU+B
X-Google-Smtp-Source: AGHT+IEZ/7BRp+uRS9nvklgUVf2SLGq8Z8YVnf3r6v7ElAdA67PrC/xXF/mqmYSEMUQX29CjECzNkD4WGfrOQXTiWbs=
X-Received: by 2002:a05:6102:2924:b0:4bb:e2a1:183e with SMTP id
 ada2fe7eead31-4c044a0017cmr10533700137.18.1741112627454; Tue, 04 Mar 2025
 10:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20250303221730.1284822-1-jaegeuk@kernel.org>
In-Reply-To: <20250303221730.1284822-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 4 Mar 2025 10:23:36 -0800
X-Gm-Features: AQ5f1JpfsRQkcPF6KIFZ7YMYTdcL01aAD6xF-xk3YtBCXsNdVl8h0JTYeOohAe8
Message-ID: <CACOAw_zmqS8UrpsYeMEEvyc_Xe9edx4ptWOtQBz3UufZM+iNag@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Mar 3, 2025 at 2:19 PM Jaegeuk Kim via Linux-f2fs-devel
    wrote: > > The checkpoint is the top priority thread which can stop all the
    filesystem > operations. Let's make it RT priority. > > [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.54 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.54 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.54 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.54 listed in wl.mailspike.net]
X-Headers-End: 1tpWvp-0007vQ-KY
Subject: Re: [f2fs-dev] [PATCH] f2fs: set highest IO priority for checkpoint
 thread
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBNYXIgMywgMjAyNSBhdCAyOjE54oCvUE0gSmFlZ2V1ayBLaW0gdmlhIExpbnV4LWYy
ZnMtZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToK
Pgo+IFRoZSBjaGVja3BvaW50IGlzIHRoZSB0b3AgcHJpb3JpdHkgdGhyZWFkIHdoaWNoIGNhbiBz
dG9wIGFsbCB0aGUgZmlsZXN5c3RlbQo+IG9wZXJhdGlvbnMuIExldCdzIG1ha2UgaXQgUlQgcHJp
b3JpdHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBmcy9mMmZzL2NoZWNrcG9pbnQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9j
aGVja3BvaW50LmMgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+IGluZGV4IGJkODkwNzM4Yjk0ZC4u
OGRiYjgxNWEzNWMwIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4gKysrIGIv
ZnMvZjJmcy9jaGVja3BvaW50LmMKPiBAQCAtMjEsNyArMjEsNyBAQAo+ICAjaW5jbHVkZSAiaW9z
dGF0LmgiCj4gICNpbmNsdWRlIDx0cmFjZS9ldmVudHMvZjJmcy5oPgo+Cj4gLSNkZWZpbmUgREVG
QVVMVF9DSEVDS1BPSU5UX0lPUFJJTyAoSU9QUklPX1BSSU9fVkFMVUUoSU9QUklPX0NMQVNTX0JF
LCAzKSkKPiArI2RlZmluZSBERUZBVUxUX0NIRUNLUE9JTlRfSU9QUklPIChJT1BSSU9fUFJJT19W
QUxVRShJT1BSSU9fQ0xBU1NfUlQsIDMpKQo+Cj4gIHN0YXRpYyBzdHJ1Y3Qga21lbV9jYWNoZSAq
aW5vX2VudHJ5X3NsYWI7Cj4gIHN0cnVjdCBrbWVtX2NhY2hlICpmMmZzX2lub2RlX2VudHJ5X3Ns
YWI7Cj4gLS0KPiAyLjQ4LjEuNzExLmcyZmVhYmFiMjVhLWdvb2cKPgoKUmV2aWV3ZWQtYnk6IERh
ZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cgo+Cj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
