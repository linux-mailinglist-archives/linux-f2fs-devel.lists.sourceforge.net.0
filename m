Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F9B2EB871
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Jan 2021 04:36:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwzcT-0000Ia-Cd; Wed, 06 Jan 2021 03:36:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kwzcR-0000IL-Si
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jan 2021 03:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2snO45VnQ9DfpOQUXz5os2mTBvmAqZ+J43JJFFTkk28=; b=jJg05xV1a/n0rtycqlguIRgfLM
 h+RlKIOoNFpdPtt6ec6KI73QPQ9CvRojOOb5anurH3RdRQZkqqGisv3F+QIis2svJMCrOhxESt/1r
 Q/PEAXmm52hHDVUJmobt0/9QE2M0iAWNPaAQBdW9ac/06XdytJklXJQnP4EkCtyWenM4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2snO45VnQ9DfpOQUXz5os2mTBvmAqZ+J43JJFFTkk28=; b=K9We1Fu8umGg5yHenKphtVuUow
 UCgK2QUUVNLz94Q6a95cE9fXmJLwIQXqlrCSat/aVMbfmKKsi3B0tunZfptHIXameoloxRVDFeqpi
 Yykx6E43KnzeKvcW2H24cEjsMG2aP6B8jAdvccjY7PEgZF+xjZm1tK30iaBV8pnmyU70=;
Received: from mail-lf1-f47.google.com ([209.85.167.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kwzcJ-001dWU-D9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jan 2021 03:36:19 +0000
Received: by mail-lf1-f47.google.com with SMTP id o13so3590421lfr.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Jan 2021 19:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2snO45VnQ9DfpOQUXz5os2mTBvmAqZ+J43JJFFTkk28=;
 b=BxzymUjKVx+WjEM1RGa5cBOvn9Q5KkUj32bIVyB6xAujEHAJpCJMoYPoNehAl2jN7H
 PuwALS1bXxIoCZpV5ofFT3bysPxSxPZ02kzaPNDQHEz3ws3CSzalTEYCQKo/N3Cr75U7
 Li7jyB4gWQ/RUCB+KY9vEM1bCIGh9B0DRZiofOnl17ZU05vHn5vIPdI+ZJT6jEjtCE7J
 gJgFayYFT8IYIdiid94DZahr3+4pB0GBewn2ixGbjhp0z8HeyJgGGbxTx1TW4cZwehAs
 Z/T7DeACIHLWbHYUU4qZYo0tbD4LCd0zrrLE40M9ewoCSSvoBrn/qbRK7ui/rpYg+zdr
 ky4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2snO45VnQ9DfpOQUXz5os2mTBvmAqZ+J43JJFFTkk28=;
 b=hBWX5LMDSDvz9y5kNcR4aI2Jdv98PaKflBWp2E7jmrr1RMZ2iFn8UwKU0SW+CkoybW
 97jTaontA4nAStiTJX/LAugvRUuPcykPHUmsg8fvL4IP+OB9BVTVcBeOfMOe5556qcjX
 lFiI2HrTvebWCzvV2aE8HRF2DtvXtMRoKbJw7eLBPQeAErV0QQ9S+VEjH3m32omeuvjB
 mluN/xORtE+QKibhsIggMynMrkXZCgQ0nl9EqQMfxnpTpH/w6TkirNeg1KotHZhQoEck
 AUBaESJ1s0FEHwcuorlrmhQgazj8yenOBi0uRXLyr1bC4DcdrANxZ0L6urFLlSMVXgyf
 yGnA==
X-Gm-Message-State: AOAM531e2OVmgMVfQYL2loUa3SQQb/45z6bP1//gc3E89wNBV2DDSm3S
 ewhDn+LzTad1A7Q7JLnbN8br2mn5CDNtdDDjaC8Ella7aYPIQw==
X-Google-Smtp-Source: ABdhPJwAoJvTQAyXXm5os8FCgE/dnwkr4Z6fBn2DAwhxeExEsV64TG0r0pOfaFH+aARaxG2E+EzzkxiWgCAEiOa5g4c=
X-Received: by 2002:ac2:5ff1:: with SMTP id s17mr1114188lfg.139.1609904164760; 
 Tue, 05 Jan 2021 19:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20210105041630.1393157-1-daeho43@gmail.com>
 <dba4be04-70dd-d48b-391c-1f2355591097@web.de>
 <6c8e6561-8a5d-010f-3d7c-8c051b4027e6@huawei.com>
In-Reply-To: <6c8e6561-8a5d-010f-3d7c-8c051b4027e6@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 6 Jan 2021 12:35:53 +0900
Message-ID: <CACOAw_wCh_Zh83SgRU2z_NR1OztKZ4b85JFkxWWhV3D6TGQCew@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.47 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.47 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kwzcJ-001dWU-D9
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix null page reference in
 redirty_blocks
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Markus Elfring <Markus.Elfring@web.de>,
 Colin Ian King <colin.king@canonical.com>, kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhhbmtzIGZvciB0aGUgbm90aWNlfgoKMjAyMeuFhCAx7JuUIDbsnbwgKOyImCkg7Jik7KCEIDEw
OjA0LCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+64uY7J20IOyekeyEsToKPgo+IERhZWhv
LAo+Cj4gRllJCj4KPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9rZXJuZWwvbXNnMzU5
NTk0NC5odG1sCj4KPiBPbiAyMDIxLzEvNSAyMDowNCwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4g
Pj4gRml4ZWQgbnVsbCBwYWdlIHJlZmVyZW5jZSB3aGVuIGZpbmRfbG9ja19wYWdlKCkgZmFpbHMg
aW4KPiA+PiByZWRpcnR5X2Jsb2NrcygpLgo+ID4KPiA+IEkgc3VnZ2VzdCB0byBjaG9vc2UgYW4g
b3RoZXIgaW1wZXJhdGl2ZSB3b3JkaW5nIGZvciB0aGlzIGNoYW5nZSBkZXNjcmlwdGlvbi4KPiA+
Cj4gPiBTZWUgYWxzbzoKPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9z
dWJtaXR0aW5nLXBhdGNoZXMucnN0P2lkPTM2YmJiZDBlMjM0ZDgxNzkzOGJkYzUyMTIxYTBmNTQ3
M2IzZTU4ZjUjbjg5Cj4gPgo+ID4KPiA+PiB2MjogY2hhbmdlZCBlcnJvciB2YWx1ZSBhbmQgYnJl
YWsgdGhlIGxvb3Agd2hlbiBlcnJvciBvY2N1cnMKPiA+Cj4gPiBJIHByb3Bvc2UgdG8gdXNlIGEg
cmV0dXJuIHN0YXRlbWVudCBpbnN0ZWFkIG9mIGEgYnJlYWsgaW4gdGhlIHNlY29uZCBpZiBicmFu
Y2gKPiA+IGZvciB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uLgo+ID4KPiA+IFNlZSBhbHNv
Ogo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1zdHlsZS5y
c3Q/aWQ9MzZiYmJkMGUyMzRkODE3OTM4YmRjNTIxMjFhMGY1NDczYjNlNThmNSNuNDgxCj4gPgo+
ID4gUmVnYXJkcywKPiA+IE1hcmt1cwo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPiBodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4g
PiAuCj4gPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
