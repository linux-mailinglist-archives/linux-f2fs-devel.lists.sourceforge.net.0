Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4088999933C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Oct 2024 21:56:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1syzH8-0007dp-J3;
	Thu, 10 Oct 2024 19:56:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1syzH8-0007di-3O
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 19:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ll+zUf8+pVpggXRhbcBYKb1wpr1Jta5nrzpQw3NsDzY=; b=DvkcSiELc/Uoon2eTExMDIsZ/2
 PuDb9PuHddHW0zBO/IQer8KYJMhThA7dvIh7LBn/If41q1YdVmrMxCkA16c1Q+HmV8TalkdtO6tSg
 tNXTTYVd1AHiy7k+RGRdF9UQh4qMm9c6CCui0O1Y9ew3bjEjrJiKohwoCW5+vR643pEE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ll+zUf8+pVpggXRhbcBYKb1wpr1Jta5nrzpQw3NsDzY=; b=ExMdcurPbGiaKGIzL57boh8WOF
 Eir/SCE8/N/JG1aEbbe7gMua8+xLDZZzI4mXOcJ3xNYhmDoBFkm+dtEOdEtcrCZJiV4oN6cQUvfUN
 f3KMv3c6kz/YokEkzEJd/4HJsP8cBnnybRCFd5VJe7FEzN41DtMzz3WSBoa6vjojHh8s=;
Received: from mail-vk1-f172.google.com ([209.85.221.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1syzH6-0004BN-TD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 19:56:41 +0000
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-5078bbc3a0bso399387e0c.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Oct 2024 12:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728590190; x=1729194990; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ll+zUf8+pVpggXRhbcBYKb1wpr1Jta5nrzpQw3NsDzY=;
 b=g7/M/Wb4G7zK/U7rZJC9IW7Mq0VGsI5RbL5M+kqgPKMJb/46eHv6CG0Bj3ZMjEP6BT
 qFWlqB/e+PdPeV7QipRzy3MrRypYp6+WvJPcsEfeiS8LT05tfJnBwJKjSURnEemlplI1
 tMWHeg1dDQ/5svQuwKT06CiIAu50WBu+Htjk9UEdB8cZG9aOY6ldalEPDNeIHSfNvYPJ
 dEEGHpAzHGUsHg49Dq1vwGXF6oB9r/RVPjzj7z8Eriu3bus/REA0y2LdjgFffQbtTHjr
 SH+ara/FVOgSUukRVHau2W3DMh4aRBf0YIg2ZiEmxYvH39hbUHWiZnYLwT36YZSurtk/
 9C8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728590190; x=1729194990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ll+zUf8+pVpggXRhbcBYKb1wpr1Jta5nrzpQw3NsDzY=;
 b=DI3rAu74095cw3I3iwqfLN9i65RyBA2wuRrXxL7RAn+eVRHG5xmL3MVE7Vu7vyOzw4
 /SYLzuBR6mBUz93yamj3cFkxZulPGGfQx5lMRtad0f5vRaQBSmrE0PJmRFD1w/hbs28b
 drtsy25E9hh+RmKCzhy1fkdjXlyanqCRNZ2wY8Hy8wxbl8riiFYMzyQnzbkcu28A5Fme
 jX0D4RvRRH0OnnFkVlyvBD7m/AyKBdGiNjlTDxFw7IF6ihoVjfFS356CMxsXkzFj/kTd
 WFHjR6bJxTMbcaExPRBj8EW2sV3lOpGaAiUZIMcyOpDlXnihv6EhghtLJI1uYjk37bhp
 ezgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzLrSSCyQ+PiE5SBx/p2q6GR2B3EOLkT47UUBRq4x6OnxPGMkYIldajxbZsqNW39kBa/MDavwO5Mtv0FwCarFf@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwznhWdHa4YzH0z0F6BZC9Cub/xGkUOBKVx6OM46gPfr/+9p1wX
 PGC+md5XOKNerzA3FZ924FsgFbttXbH1e6ju+2Pmn640+IQjV7UrlFeCohKkHRyvje7BA03xEai
 IpUzksrchnjcJRiemqpe0ZU2/gtaYPSCI
X-Google-Smtp-Source: AGHT+IF0FbgxcM0z3IsnyEWo6M4VFT66JVWSxbkmp9oUUF5mXwopBFUspVDLMVlV0NkCSPtXgjkq8tnZyI51H1M8X5I=
X-Received: by 2002:a05:6122:a0e:b0:50a:8cb6:e9ca with SMTP id
 71dfb90a1353d-50d1f4c9334mr23402e0c.2.1728590189800; Thu, 10 Oct 2024
 12:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241010000923.1278817-1-jaegeuk@kernel.org>
In-Reply-To: <20241010000923.1278817-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 10 Oct 2024 12:56:18 -0700
Message-ID: <CACOAw_zuRue4baJczA1o7Uip3Wm=JN14p98+Kqma-VL39_GNaA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong Thanks, On Wed, Oct 9, 2024 at 5:10 PM
    Jaegeuk Kim via Linux-f2fs-devel wrote: > > This fixes a regression which
    prevents parallel DIO reads. > > Fixes: 0cac51185e65 ("f2fs: fix to avoid
    racing in between [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.172 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1syzH6-0004BN-TD
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow parallel DIO reads
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

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpUaGFua3Ms
CgpPbiBXZWQsIE9jdCA5LCAyMDI0IGF0IDU6MTDigK9QTSBKYWVnZXVrIEtpbSB2aWEgTGludXgt
ZjJmcy1kZXZlbAo8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+IHdyb3Rl
Ogo+Cj4gVGhpcyBmaXhlcyBhIHJlZ3Jlc3Npb24gd2hpY2ggcHJldmVudHMgcGFyYWxsZWwgRElP
IHJlYWRzLgo+Cj4gRml4ZXM6IDBjYWM1MTE4NWU2NSAoImYyZnM6IGZpeCB0byBhdm9pZCByYWNp
bmcgaW4gYmV0d2VlbiByZWFkIGFuZCBPUFUgZGlvIHdyaXRlIikKPiBTaWduZWQtb2ZmLWJ5OiBK
YWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9mMmZzL2ZpbGUuYyB8
IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gaW5kZXgg
NzFkNWRlZDllZWRhLi5hZGM3ZDY0YTZmNDcgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9maWxlLmMK
PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+IEBAIC00NjQ3LDcgKzQ2NDcsOCBAQCBzdGF0aWMgc3Np
emVfdCBmMmZzX2ZpbGVfcmVhZF9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9p
dGVyICp0bykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW92X2l0
ZXJfY291bnQodG8pLCBSRUFEKTsKPgo+ICAgICAgICAgLyogSW4gTEZTIG1vZGUsIGlmIHRoZXJl
IGlzIGluZmxpZ2h0IGRpbywgd2FpdCBmb3IgaXRzIGNvbXBsZXRpb24gKi8KPiAtICAgICAgIGlm
IChmMmZzX2xmc19tb2RlKEYyRlNfSV9TQihpbm9kZSkpKQo+ICsgICAgICAgaWYgKGYyZnNfbGZz
X21vZGUoRjJGU19JX1NCKGlub2RlKSkgJiYKPiArICAgICAgICAgICBnZXRfcGFnZXMoRjJGU19J
X1NCKGlub2RlKSwgRjJGU19ESU9fV1JJVEUpKQo+ICAgICAgICAgICAgICAgICBpbm9kZV9kaW9f
d2FpdChpbm9kZSk7Cj4KPiAgICAgICAgIGlmIChmMmZzX3Nob3VsZF91c2VfZGlvKGlub2RlLCBp
b2NiLCB0bykpIHsKPiAtLQo+IDIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdvb2cKPgo+Cj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
