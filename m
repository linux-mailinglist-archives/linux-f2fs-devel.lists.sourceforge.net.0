Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C90996ED4E2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 20:55:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pr1LR-0005UQ-I8;
	Mon, 24 Apr 2023 18:55:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <agruenba@redhat.com>) id 1pr1LQ-0005UK-7B
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 18:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cC2m6cj4by0ic+ocHcPEbRFoxwEEiKQQoS0Ge1Avf1U=; b=T3Tnl+sYdI0qMZ+QcOZYy0ur+N
 HTNQR6lboVlHknPUDWIHyNE9HUa6Pzgki1zPQA8I7QkSI9lR5yaBOrm3aCjab22Li8upVKJ7sY6Ay
 TVhTTkd9YoHiNGoeBSGx4eWwyQxsu76t594Du8ee/2W8PDCixIrxDUzeYVtYAM9jbBbQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cC2m6cj4by0ic+ocHcPEbRFoxwEEiKQQoS0Ge1Avf1U=; b=Tw5VZri78k4YiLib0ERyskR6+t
 /7AiIk9fQS2Tp2f8YJEPScO+euY8BIq3Gp4TDNE/a1Zd2Xa4UN5W9w7dJC4vKUPgh1YECnYk6Utkr
 nLTCOLAFw/gxD6VG1TmXa06Rma8kgtR1v6Adiq2SoTkYhDsiVFZl1Es9Y0qdCLwQ3a4M=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pr1LJ-000Gjx-C6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 18:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682362511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cC2m6cj4by0ic+ocHcPEbRFoxwEEiKQQoS0Ge1Avf1U=;
 b=JMK2mwKmD1wcRlKtYqYl0AzWNCF8UMQLJEacoyPNSuZpjBUwEh5SFvj8HTp5yfvJo2j+Uh
 mGAs6WZ8OTEw0e2g2QDsO4q/0+a2jIeH4PRQHRSZ0ypP7t+fjGU33hQ8Xa7U6GfzQHAYpt
 nuMz++cKZxB5wGac/vbNBZWSjCJfOOU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-wxncUMNDNxW9DtLu7RR1eg-1; Mon, 24 Apr 2023 14:55:09 -0400
X-MC-Unique: wxncUMNDNxW9DtLu7RR1eg-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-246819e2cdaso4715446a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Apr 2023 11:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682362508; x=1684954508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cC2m6cj4by0ic+ocHcPEbRFoxwEEiKQQoS0Ge1Avf1U=;
 b=eL5vy4afCq7YBa02+iaCmuBExyHGB9lheHW3bNgjZHVFDPyKqGk+B6GwBMnr57xIaj
 bx/0Df9nFpXX+pAFJrYK3kLGng+POydjvbDl86c4od3eqVqyAeUBanI+S+BGAFHnrZEK
 TF1LAmRgSwll4KXR7IYv6Vlu6eLt+wRC5a9SLL2k9AF4kVrBwm/Si3zwycPfOsk7kXt+
 mXoWa86A7DOPpHRB5y6vVCYjeFkTvnLnmliY9suSFrLjlCbNkc8orGd88Ry73Np1na8c
 nEsMthcfyLNAqRZLbtYHtSkDNIMmRUCViN2n9m1p2QUgClAW6dItO9/CwVIRw+iBbk0h
 Fe/A==
X-Gm-Message-State: AAQBX9drBb4nmpXHvdn3qqRKyFAIBCJcftYfvlBYAQ5Dk0/cdnvuSnih
 gaOWfPRe6adBXx1CNHaneXDjoejgogliZF317cerxHiwfQUAWzrg8SU/Ys0meS0csaMCkzKwSdh
 zboUQ4FZunQRuJKMqwuvFGSdLWfdnR+TQBJSjFqo2XGUGIOiVcZ2tQw==
X-Received: by 2002:a17:90b:3a8d:b0:23e:f855:79ed with SMTP id
 om13-20020a17090b3a8d00b0023ef85579edmr14646833pjb.28.1682362508595; 
 Mon, 24 Apr 2023 11:55:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350bw6UUmfa7x2kgzI/S3M36kQcMIx/LORGs9afdrTUJulizrDq8UK+lWvA5A9k5nXONeKEERR5M4Fbn0vBOkkLM=
X-Received: by 2002:a17:90b:3a8d:b0:23e:f855:79ed with SMTP id
 om13-20020a17090b3a8d00b0023ef85579edmr14646811pjb.28.1682362508271; Mon, 24
 Apr 2023 11:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-6-hch@lst.de>
In-Reply-To: <20230424054926.26927-6-hch@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 24 Apr 2023 20:54:56 +0200
Message-ID: <CAHc6FU7tuLJk1JEHdmK7VmEuvuG2sMg1=D9qYJAuhn2ES4NFAA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Apr 24, 2023 at 8:22 AM Christoph Hellwig <hch@lst.de>
    wrote: > All callers of generic_perform_write need to updated ki_pos, move
    it into > common code. We've actually got a similar situation with iomap_file_buffered_write()
    and its callers. Would it make sense to fix that up as well? 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [170.10.129.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [170.10.129.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pr1LJ-000Gjx-C6
Subject: Re: [f2fs-dev] [Cluster-devel] [PATCH 05/17] filemap: update ki_pos
 in generic_perform_write
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
Cc: Jens Axboe <axboe@kernel.dk>, cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 "Darrick J. Wong" <djwong@kernel.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBBcHIgMjQsIDIwMjMgYXQgODoyMuKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPiBBbGwgY2FsbGVycyBvZiBnZW5lcmljX3BlcmZvcm1fd3JpdGUgbmVl
ZCB0byB1cGRhdGVkIGtpX3BvcywgbW92ZSBpdCBpbnRvCj4gY29tbW9uIGNvZGUuCgpXZSd2ZSBh
Y3R1YWxseSBnb3QgYSBzaW1pbGFyIHNpdHVhdGlvbiB3aXRoCmlvbWFwX2ZpbGVfYnVmZmVyZWRf
d3JpdGUoKSBhbmQgaXRzIGNhbGxlcnMuIFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8KZml4IHRoYXQg
dXAgYXMgd2VsbD8KCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+Cj4gLS0tCj4gIGZzL2NlcGgvZmlsZS5jIHwgMiAtLQo+ICBmcy9leHQ0L2ZpbGUuYyB8IDkg
KysrLS0tLS0tCj4gIGZzL2YyZnMvZmlsZS5jIHwgMSAtCj4gIGZzL25mcy9maWxlLmMgIHwgMSAt
Cj4gIG1tL2ZpbGVtYXAuYyAgIHwgOCArKysrLS0tLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvY2VwaC9maWxl
LmMgYi9mcy9jZXBoL2ZpbGUuYwo+IGluZGV4IGY0ZDhiZjdkZWM4OGE4Li5mZWViOTg4MmVmNjM1
YSAxMDA2NDQKPiAtLS0gYS9mcy9jZXBoL2ZpbGUuYwo+ICsrKyBiL2ZzL2NlcGgvZmlsZS5jCj4g
QEAgLTE4OTQsOCArMTg5NCw2IEBAIHN0YXRpYyBzc2l6ZV90IGNlcGhfd3JpdGVfaXRlcihzdHJ1
Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKPiAgICAgICAgICAgICAgICAg
ICogY2FuIG5vdCBydW4gYXQgdGhlIHNhbWUgdGltZQo+ICAgICAgICAgICAgICAgICAgKi8KPiAg
ICAgICAgICAgICAgICAgd3JpdHRlbiA9IGdlbmVyaWNfcGVyZm9ybV93cml0ZShpb2NiLCBmcm9t
KTsKPiAtICAgICAgICAgICAgICAgaWYgKGxpa2VseSh3cml0dGVuID49IDApKQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIGlvY2ItPmtpX3BvcyA9IHBvcyArIHdyaXR0ZW47Cj4gICAgICAgICAg
ICAgICAgIGNlcGhfZW5kX2lvX3dyaXRlKGlub2RlKTsKPiAgICAgICAgIH0KPgo+IGRpZmYgLS1n
aXQgYS9mcy9leHQ0L2ZpbGUuYyBiL2ZzL2V4dDQvZmlsZS5jCj4gaW5kZXggMGI4YjQ0OTllNWNh
MTguLjEwMjZhY2FmMTIzNWEwIDEwMDY0NAo+IC0tLSBhL2ZzL2V4dDQvZmlsZS5jCj4gKysrIGIv
ZnMvZXh0NC9maWxlLmMKPiBAQCAtMjkxLDEyICsyOTEsOSBAQCBzdGF0aWMgc3NpemVfdCBleHQ0
X2J1ZmZlcmVkX3dyaXRlX2l0ZXIoc3RydWN0IGtpb2NiICppb2NiLAo+Cj4gIG91dDoKPiAgICAg
ICAgIGlub2RlX3VubG9jayhpbm9kZSk7Cj4gLSAgICAgICBpZiAobGlrZWx5KHJldCA+IDApKSB7
Cj4gLSAgICAgICAgICAgICAgIGlvY2ItPmtpX3BvcyArPSByZXQ7Cj4gLSAgICAgICAgICAgICAg
IHJldCA9IGdlbmVyaWNfd3JpdGVfc3luYyhpb2NiLCByZXQpOwo+IC0gICAgICAgfQo+IC0KPiAt
ICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICBpZiAodW5saWtlbHkocmV0IDw9IDApKQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgcmV0dXJuIGdlbmVyaWNfd3JpdGVf
c3luYyhpb2NiLCByZXQpOwo+ICB9Cj4KPiAgc3RhdGljIHNzaXplX3QgZXh0NF9oYW5kbGVfaW5v
ZGVfZXh0ZW5zaW9uKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQsCj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPiBpbmRleCBmNGFiMjNlZmNm
ODVmOC4uNWE5YWUwNTRiNmRhN2QgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiArKysg
Yi9mcy9mMmZzL2ZpbGUuYwo+IEBAIC00NTExLDcgKzQ1MTEsNiBAQCBzdGF0aWMgc3NpemVfdCBm
MmZzX2J1ZmZlcmVkX3dyaXRlX2l0ZXIoc3RydWN0IGtpb2NiICppb2NiLAo+ICAgICAgICAgY3Vy
cmVudC0+YmFja2luZ19kZXZfaW5mbyA9IE5VTEw7Cj4KPiAgICAgICAgIGlmIChyZXQgPiAwKSB7
Cj4gLSAgICAgICAgICAgICAgIGlvY2ItPmtpX3BvcyArPSByZXQ7Cj4gICAgICAgICAgICAgICAg
IGYyZnNfdXBkYXRlX2lvc3RhdChGMkZTX0lfU0IoaW5vZGUpLCBpbm9kZSwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBUFBfQlVGRkVSRURfSU8sIHJl
dCk7Cj4gICAgICAgICB9Cj4gZGlmZiAtLWdpdCBhL2ZzL25mcy9maWxlLmMgYi9mcy9uZnMvZmls
ZS5jCj4gaW5kZXggODkzNjI1ZWFjYWI5ZmEuLmFiZGFlMmIyOTM2OWJlIDEwMDY0NAo+IC0tLSBh
L2ZzL25mcy9maWxlLmMKPiArKysgYi9mcy9uZnMvZmlsZS5jCj4gQEAgLTY2Niw3ICs2NjYsNiBA
QCBzc2l6ZV90IG5mc19maWxlX3dyaXRlKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9p
dGVyICpmcm9tKQo+ICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPgo+ICAgICAgICAgd3JpdHRl
biA9IHJlc3VsdDsKPiAtICAgICAgIGlvY2ItPmtpX3BvcyArPSB3cml0dGVuOwo+ICAgICAgICAg
bmZzX2FkZF9zdGF0cyhpbm9kZSwgTkZTSU9TX05PUk1BTFdSSVRURU5CWVRFUywgd3JpdHRlbik7
Cj4KPiAgICAgICAgIGlmIChtbnRmbGFncyAmIE5GU19NT1VOVF9XUklURV9FQUdFUikgewo+IGRp
ZmYgLS1naXQgYS9tbS9maWxlbWFwLmMgYi9tbS9maWxlbWFwLmMKPiBpbmRleCAyNzIzMTA0Y2Mw
NmExMi4uMDExMGJkZTM3MDhiM2YgMTAwNjQ0Cj4gLS0tIGEvbW0vZmlsZW1hcC5jCj4gKysrIGIv
bW0vZmlsZW1hcC5jCj4gQEAgLTM5NjAsNyArMzk2MCwxMCBAQCBzc2l6ZV90IGdlbmVyaWNfcGVy
Zm9ybV93cml0ZShzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqaSkKPiAgICAg
ICAgICAgICAgICAgYmFsYW5jZV9kaXJ0eV9wYWdlc19yYXRlbGltaXRlZChtYXBwaW5nKTsKPiAg
ICAgICAgIH0gd2hpbGUgKGlvdl9pdGVyX2NvdW50KGkpKTsKPgo+IC0gICAgICAgcmV0dXJuIHdy
aXR0ZW4gPyB3cml0dGVuIDogc3RhdHVzOwo+ICsgICAgICAgaWYgKCF3cml0dGVuKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gc3RhdHVzOwo+ICsgICAgICAgaW9jYi0+a2lfcG9zICs9IHdyaXR0
ZW47CgpDb3VsZCBiZSB0dXJuZWQgaW50bzoKaW9jYi0+a2lfcG9zID0gcG9zOwoKPiArICAgICAg
IHJldHVybiB3cml0dGVuOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZ2VuZXJpY19wZXJmb3JtX3dy
aXRlKTsKPgo+IEBAIC00MDM5LDcgKzQwNDIsNiBAQCBzc2l6ZV90IF9fZ2VuZXJpY19maWxlX3dy
aXRlX2l0ZXIoc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKmZyb20pCj4gICAg
ICAgICAgICAgICAgIGVuZGJ5dGUgPSBwb3MgKyBzdGF0dXMgLSAxOwo+ICAgICAgICAgICAgICAg
ICBlcnIgPSBmaWxlbWFwX3dyaXRlX2FuZF93YWl0X3JhbmdlKG1hcHBpbmcsIHBvcywgZW5kYnl0
ZSk7Cj4gICAgICAgICAgICAgICAgIGlmIChlcnIgPT0gMCkgewo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGlvY2ItPmtpX3BvcyA9IGVuZGJ5dGUgKyAxOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHdyaXR0ZW4gKz0gc3RhdHVzOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGludmFsaWRh
dGVfbWFwcGluZ19wYWdlcyhtYXBwaW5nLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwb3MgPj4gUEFHRV9TSElGVCwKPiBAQCAtNDA1Miw4ICs0MDU0
LDYgQEAgc3NpemVfdCBfX2dlbmVyaWNfZmlsZV93cml0ZV9pdGVyKHN0cnVjdCBraW9jYiAqaW9j
Yiwgc3RydWN0IGlvdl9pdGVyICpmcm9tKQo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9
IGVsc2Ugewo+ICAgICAgICAgICAgICAgICB3cml0dGVuID0gZ2VuZXJpY19wZXJmb3JtX3dyaXRl
KGlvY2IsIGZyb20pOwo+IC0gICAgICAgICAgICAgICBpZiAobGlrZWx5KHdyaXR0ZW4gPiAwKSkK
PiAtICAgICAgICAgICAgICAgICAgICAgICBpb2NiLT5raV9wb3MgKz0gd3JpdHRlbjsKPiAgICAg
ICAgIH0KPiAgb3V0Ogo+ICAgICAgICAgY3VycmVudC0+YmFja2luZ19kZXZfaW5mbyA9IE5VTEw7
Cj4gLS0KPiAyLjM5LjIKPgoKVGhhbmtzLApBbmRyZWFzCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
