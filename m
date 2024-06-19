Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE8E90E1A0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jun 2024 04:28:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJl3G-0006iH-1j;
	Wed, 19 Jun 2024 02:27:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <drosen@google.com>) id 1sJl3F-0006i6-AD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jun 2024 02:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y6aS2aqs3SDi1cihzeENr1mMLZcKHXibGpAEMbwQaVw=; b=j5XgSXXZfyEgJHCJJgr+Zpuysf
 BuY4nm4VZ9bvJUigMiqjzSGWQneNThZtibN78lGUQ+1EKjETZ2Eo0GcJa/goVVbH+DFSAHlIxPRzV
 2g72uLoxGW5Sjlhka2HCn6Vh9KHYCRFa5uYOApWh3TQ9P/spuHONleGMua3rt5aLESKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y6aS2aqs3SDi1cihzeENr1mMLZcKHXibGpAEMbwQaVw=; b=iEgJZV6XpS0rjiXE/npiy8UQH1
 tsOJdC1QSHKtvGZK0n+wjay4hUQw2aj69TyqeQg9/9dnvCSSo1/c0GGC2Z6sboPpb8YTadwZv4Dv9
 IiZ/ohvQR20pGx4zOKk3jdFroibTqFmRoB8X/LbOVXE8FaW9kFKh17Qs+810kHYeqrYQ=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJl3F-0006tP-MV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jun 2024 02:27:57 +0000
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-57cb9efd8d1so678596a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jun 2024 19:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718764065; x=1719368865;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y6aS2aqs3SDi1cihzeENr1mMLZcKHXibGpAEMbwQaVw=;
 b=kyKLRbXhxCpV+LIV4Fmu4FPloWZC6K2TSODBi499IksINARZMwF/3IvhyM06rHkcwZ
 N/jshOV0t7Te+cIjLu330u4/xAbWa+7fkMR2g4sUQS4Zvv5saNg+lYZBo/kj+tW9c9e9
 soMtiuUtCkXxTQFNjyla+aaGR4Ode4AArGzYSMQZNXMGml1dRRUK39si2belPES7wECD
 vwtDA9I28UdPxWExUgF7vnaGF6QlFg4YrUOJjh9eh5hvHJjk5TPeJsPeLZ8nF//Mde//
 3mEYBMjoGg/qvQrKi8lv/SchIaxTTxVUqXYcfyc3RpC/rZKPOsUBJU4tjIA5kPBHO5pj
 evFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718764065; x=1719368865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y6aS2aqs3SDi1cihzeENr1mMLZcKHXibGpAEMbwQaVw=;
 b=IfpLoulHk73kL48h0fpZWcSPty3M5uwKkjN8dZ/kZSCo66x/0ZURHXraUOUWXGxJLW
 SrhpJIEPOG0ONQl8Z9MEYNVD/xqosvlhQ4dtYyVTBZGmh84F29Q9PSnWEvMXwNZeVwGW
 8AvS4SLgEOsOf9jC8IcU7q8SxV+MTLOSknzInRZelrE0BDBuEVggu2HmXLeQ7/gkPa+B
 M1JMPAiGyen0F7E/kMwI8THrStXfIaaLRUVn6NhMSlL4Jrm5VPxGLNFfOA7SsL4/oDbp
 5MWcULeJm+xbkng39B99p4WAFKcVognT4E9G4mKaCTXEKhs5ToRFNujhkVAPyJbBuctC
 /Dww==
X-Gm-Message-State: AOJu0YwvJkkqCGqwTWxni1hMrwuCTGZW+BX0SYsD3xhL9QjYDxXvBLPS
 7oCl5HMA3x31bpaEf8TkN2d1IY1habmZhvtvONKIUL91hS5ZCra0OFZOyNGSKKso52eFXdtZn9g
 yhQzOb6aShQkC8WupY46F6yVgGEHKx0ofK83AOo6RBBDh5JLeTQ==
X-Google-Smtp-Source: AGHT+IEgSdqF6PtMYe9SdC0v3biP9V0ikdBWBr5WkDh6RlbxXh3i/RNc0FHXwLWHLKQvKJNn07Mt/B+YxhZVUAwdy+4=
X-Received: by 2002:a05:6000:248:b0:363:337a:3e0 with SMTP id
 ffacd0b85a97d-363338946b5mr590326f8f.1.1718761048277; Tue, 18 Jun 2024
 18:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240619012509.1885974-1-drosen@google.com>
 <f36fe619-da24-4b8f-ae3c-75064658e264@kernel.org>
In-Reply-To: <f36fe619-da24-4b8f-ae3c-75064658e264@kernel.org>
Date: Tue, 18 Jun 2024 18:37:16 -0700
Message-ID: <CA+PiJmRnu7AGhx5m3MLyup22TNTTY7v4LUz4gDE3oz6a+qwX1Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jun 18, 2024 at 6:30 PM Chao Yu <chao@kernel.org>
    wrote: > > On 2024/6/19 9:25, Daniel Rosenberg wrote: > > These were described
    in man pages, but not within the help message. > > > > Signed [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.208.43 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.208.43 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.208.43 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.43 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1sJl3F-0006tP-MV
Subject: Re: [f2fs-dev] [PATCH] dump.f2fs: Add help description for -rfyPo
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gMTgsIDIwMjQgYXQgNjozMOKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzYvMTkgOToyNSwgRGFuaWVsIFJvc2VuYmVyZyB3cm90ZToK
PiA+IFRoZXNlIHdlcmUgZGVzY3JpYmVkIGluIG1hbiBwYWdlcywgYnV0IG5vdCB3aXRoaW4gdGhl
IGhlbHAgbWVzc2FnZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgUm9zZW5iZXJnIDxk
cm9zZW5AZ29vZ2xlLmNvbT4KPgo+IENhbiB5b3UgcGxlYXNlIGNoZWNrIGJlbG93IHBhdGNoPwo+
Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamFlZ2V1
ay9mMmZzLXRvb2xzLmdpdC9jb21taXQvP2g9ZGV2LXRlc3QmaWQ9YzA3YjA5NTQ1MDZhMTU5ZjY4
MzU4ZWRkZGMwOWJlMGE0ZDgxMGU2MQo+Cj4gVGhhbmtzLAo+Cj4gPiAtLS0KPiA+ICAgZnNjay9t
YWluLmMgfCA1ICsrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZnNjay9tYWluLmMgYi9mc2NrL21haW4uYwo+ID4gaW5kZXggNmVk
YzkwMi4uOTAxZmE3YSAxMDA2NDQKPiA+IC0tLSBhL2ZzY2svbWFpbi5jCj4gPiArKysgYi9mc2Nr
L21haW4uYwo+ID4gQEAgLTk3LDYgKzk3LDExIEBAIHZvaWQgZHVtcF91c2FnZSgpCj4gPiAgICAg
ICBNU0coMCwgIiAgLVMgc3BhcnNlX21vZGVcbiIpOwo+ID4gICAgICAgTVNHKDAsICIgIC1hIFtT
U0EgZHVtcCBzZWdubyBmcm9tICMxfiMyIChkZWNpbWFsKSwgZm9yIGFsbCAwfi0xXVxuIik7Cj4g
PiAgICAgICBNU0coMCwgIiAgLWIgYmxrX2FkZHIgKGluIDRLQilcbiIpOwo+ID4gKyAgICAgTVNH
KDAsICIgIC1yIFJlY3Vyc2l2ZWx5IGR1bXAgZnJvbSB0aGUgcm9vdCBpbm9kZVxuIik7Cj4gPiAr
ICAgICBNU0coMCwgIiAgLWYgRG8gbm90IHByb21wdCBiZWZvcmUgZHVtcGluZ1xuIik7Cj4gPiAr
ICAgICBNU0coMCwgIiAgLXkgQWxpYXMgZm9yIC1mXG4iKTsKPiA+ICsgICAgIE1TRygwLCAiICAt
UCBQcmVzZXJ2ZSBtb2RlL093bmVyL0dyb3VwIGZvciBkdW1wZWQgaW5vZGVcbiIpOwo+ID4gKyAg
ICAgTVNHKDAsICIgIC1vIDxwYXRoPiAgRHVtcCBpbm9kZXMgdG8gdGhlIGdpdmVuIHBhdGhcbiIp
Owo+ID4gICAgICAgTVNHKDAsICIgIC1WIHByaW50IHRoZSB2ZXJzaW9uIG51bWJlciBhbmQgZXhp
dFxuIik7Cj4gPgo+ID4gICAgICAgZXhpdCgxKTsKPiA+Cj4gPiBiYXNlLWNvbW1pdDogYzFhOTc4
NjJiMDVkOGE3MzZhZDg3MTk5MzkzOTVjNjFiZDcxYzk4Mgo+Cj4gVG8gdW5zdWJzY3JpYmUgZnJv
bSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBl
bWFpbCB0byBrZXJuZWwtdGVhbSt1bnN1YnNjcmliZUBhbmRyb2lkLmNvbS4KPgpBaCwgSSBtaXNz
ZWQgdGhhdCBvbmUuIFRoYXQgd2lsbCB3b3JrIDopCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
