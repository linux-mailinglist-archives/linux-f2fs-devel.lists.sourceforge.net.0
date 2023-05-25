Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1068771104A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 May 2023 18:03:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2DQk-0003uX-TQ;
	Thu, 25 May 2023 16:03:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <agruenba@redhat.com>) id 1q2DQg-0003uQ-Lj
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 16:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WiRt50oXKhasmrzR2kh6FHaULiNwoG0spSQORGoTHTA=; b=f/oFkvSPeCxdMlOd7jTMl/wmbO
 TxJRsGe+4dRk86aHdbw3hLdI+PHYdD1O2yNK33LtvsgA9T/llJNhAJyvB7fQSnuUAUsZ+qcU9jhRF
 c54Gmbzhm+cN4nAmbpRpO+h/8K1N1JbOnTaWPrlNRUEFPEV2/vc0IBQX91cDvMUB8KME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WiRt50oXKhasmrzR2kh6FHaULiNwoG0spSQORGoTHTA=; b=ZIiCHqYcESl+uRGTUYZKCR4dfD
 5EnAa7/LmjfCySZXII0vEdcjmwqjlRtF42yOVhrlmJNJF8uzBqH6MvSaZwBFUts1NzqOND68Cx2F5
 DdNtH/xVpBMay+0xCbiBSAbcFSmmreLaJUPgAIGgmGg3HSVR0YPpTAsyynKjEGMyGo7A=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2DQa-0007ra-Rk for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 16:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685030574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WiRt50oXKhasmrzR2kh6FHaULiNwoG0spSQORGoTHTA=;
 b=XUP7UROl5HBAugXj1iXk5AdSwKwQD3khNOaLBldJF205UZxPUypP4P9G6nPGrnqFdKIRCe
 fegx+49de2qE2PREfJan86+lrNTZV7V8rfoUgUOk0SmQdrKRQszNtxeLXDy+ADLa2lUtSY
 Tad9dFKrwVzcHXly2WNIgEu5p9BriBE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-Te4IBpDrMHW2bEtT41M1CA-1; Thu, 25 May 2023 12:02:53 -0400
X-MC-Unique: Te4IBpDrMHW2bEtT41M1CA-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1ae8ed0a9dfso9940945ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 May 2023 09:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685030570; x=1687622570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WiRt50oXKhasmrzR2kh6FHaULiNwoG0spSQORGoTHTA=;
 b=AiKx8Rkp1iqCMIGJSNOUq/o3YgNBMZkgF1LutZMa94Q+Lw3ERlAz6vvseUJj7mqc1Z
 /fuGe3ScMuzZw//3JUi+hTZCiZtM5oNBamZINiYIbkIdKxxxwoGf21oNiE2OIJAbfdkq
 0kxj3HrRk6y+a6/qX0ebrhETgPhWXy+eXnRokYmc9nVG4UB2o2bUkNvPcf3HShjZREnX
 XG5FdhA6Sy1ORh0v8FAS700Z+5MEWjCo1DJ1uOfaVC8iEqAOxkyGo8o57WjXmFaRGbfb
 9EU4qX0ge/JWGDUIt2WRMGdnoV/efX2sQyaUTeL50fPO+VbUsk2TcFf1Otn+GzVfJkC8
 ieUg==
X-Gm-Message-State: AC+VfDwdcgNL44lvQ2RzTisMHwM2wPdWLpdvD55SEEprcrb+tNlflh2k
 pdw4WVvoIGcx0NL2v+znPk4F8ZGPWUH+Vj5smrXScZzSutWi7aDLJMcomYPWbyvG52e9vsAvOWY
 1KInwt+nnkCDsbMprc5lxiwIyV/R4SxLxZ55qaxGw7zv66bWSAOiF2ja5hG6DwfQQ1xQ=
X-Received: by 2002:a17:902:f54c:b0:1af:f64c:f363 with SMTP id
 h12-20020a170902f54c00b001aff64cf363mr3052075plf.15.1685030569937; 
 Thu, 25 May 2023 09:02:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6IxaSUVZPKltFK7HOITIsIRGnmd5NzIdTwh6dJNU2vgkdbKhe1zl+1aodXLLyyl7kcWSFpgVAL2XCU4JAoynY=
X-Received: by 2002:a17:902:f54c:b0:1af:f64c:f363 with SMTP id
 h12-20020a170902f54c00b001aff64cf363mr3052030plf.15.1685030569588; Thu, 25
 May 2023 09:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230524063810.1595778-1-hch@lst.de>
 <20230524063810.1595778-8-hch@lst.de>
In-Reply-To: <20230524063810.1595778-8-hch@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 25 May 2023 18:02:37 +0200
Message-ID: <CAHc6FU6akk6yg1YGpgq-XqMv7soOLA4_Jg17T1M+NKn1PRmJkg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, May 24, 2023 at 8:54 AM Christoph Hellwig <hch@lst.de>
    wrote: > All callers of iomap_file_buffered_write need to updated ki_pos,
    move it > into common code. Thanks for this set of cleanups, especially for
    the patch killing current->backing_dev_info. 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [170.10.133.124 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2DQa-0007ra-Rk
Subject: Re: [f2fs-dev] [PATCH 07/11] iomap: update ki_pos in
 iomap_file_buffered_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBNYXkgMjQsIDIwMjMgYXQgODo1NOKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPiBBbGwgY2FsbGVycyBvZiBpb21hcF9maWxlX2J1ZmZlcmVkX3dyaXRl
IG5lZWQgdG8gdXBkYXRlZCBraV9wb3MsIG1vdmUgaXQKPiBpbnRvIGNvbW1vbiBjb2RlLgoKVGhh
bmtzIGZvciB0aGlzIHNldCBvZiBjbGVhbnVwcywgZXNwZWNpYWxseSBmb3IgdGhlIHBhdGNoIGtp
bGxpbmcKY3VycmVudC0+YmFja2luZ19kZXZfaW5mby4KClJldmlld2VkLWJ5OiBBbmRyZWFzIEdy
dWVuYmFjaGVyIDxhZ3J1ZW5iYUByZWRoYXQuY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBBY2tlZC1ieTogRGFtaWVuIExlIE1vYWwgPGRsZW1v
YWxAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogRGFycmljayBKLiBXb25nIDxkandvbmdAa2Vy
bmVsLm9yZz4KPiAtLS0KPiAgZnMvZ2ZzMi9maWxlLmMgICAgICAgICB8IDQgKy0tLQo+ICBmcy9p
b21hcC9idWZmZXJlZC1pby5jIHwgOSArKysrKystLS0KPiAgZnMveGZzL3hmc19maWxlLmMgICAg
ICB8IDIgLS0KPiAgZnMvem9uZWZzL2ZpbGUuYyAgICAgICB8IDQgKy0tLQo+ICA0IGZpbGVzIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZnMvZ2ZzMi9maWxlLmMgYi9mcy9nZnMyL2ZpbGUuYwo+IGluZGV4IDkwNGEwZDZhYzFhMWE5Li5j
NmE3NTU1ZDVhZDhiYiAxMDA2NDQKPiAtLS0gYS9mcy9nZnMyL2ZpbGUuYwo+ICsrKyBiL2ZzL2dm
czIvZmlsZS5jCj4gQEAgLTEwNDQsMTAgKzEwNDQsOCBAQCBzdGF0aWMgc3NpemVfdCBnZnMyX2Zp
bGVfYnVmZmVyZWRfd3JpdGUoc3RydWN0IGtpb2NiICppb2NiLAo+ICAgICAgICAgcGFnZWZhdWx0
X2Rpc2FibGUoKTsKPiAgICAgICAgIHJldCA9IGlvbWFwX2ZpbGVfYnVmZmVyZWRfd3JpdGUoaW9j
YiwgZnJvbSwgJmdmczJfaW9tYXBfb3BzKTsKPiAgICAgICAgIHBhZ2VmYXVsdF9lbmFibGUoKTsK
PiAtICAgICAgIGlmIChyZXQgPiAwKSB7Cj4gLSAgICAgICAgICAgICAgIGlvY2ItPmtpX3BvcyAr
PSByZXQ7Cj4gKyAgICAgICBpZiAocmV0ID4gMCkKPiAgICAgICAgICAgICAgICAgd3JpdHRlbiAr
PSByZXQ7Cj4gLSAgICAgICB9Cj4KPiAgICAgICAgIGlmIChpbm9kZSA9PSBzZHAtPnNkX3JpbmRl
eCkKPiAgICAgICAgICAgICAgICAgZ2ZzMl9nbG9ja19kcV91bmluaXQoc3RhdGZzX2doKTsKPiBk
aWZmIC0tZ2l0IGEvZnMvaW9tYXAvYnVmZmVyZWQtaW8uYyBiL2ZzL2lvbWFwL2J1ZmZlcmVkLWlv
LmMKPiBpbmRleCAwNjMxMzNlYzc3ZjQ5ZS4uNTUwNTI1YTUyNWM0NWMgMTAwNjQ0Cj4gLS0tIGEv
ZnMvaW9tYXAvYnVmZmVyZWQtaW8uYwo+ICsrKyBiL2ZzL2lvbWFwL2J1ZmZlcmVkLWlvLmMKPiBA
QCAtODY0LDE2ICs4NjQsMTkgQEAgaW9tYXBfZmlsZV9idWZmZXJlZF93cml0ZShzdHJ1Y3Qga2lv
Y2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqaSwKPiAgICAgICAgICAgICAgICAgLmxlbiAgICAg
ICAgICAgID0gaW92X2l0ZXJfY291bnQoaSksCj4gICAgICAgICAgICAgICAgIC5mbGFncyAgICAg
ICAgICA9IElPTUFQX1dSSVRFLAo+ICAgICAgICAgfTsKPiAtICAgICAgIGludCByZXQ7Cj4gKyAg
ICAgICBzc2l6ZV90IHJldDsKPgo+ICAgICAgICAgaWYgKGlvY2ItPmtpX2ZsYWdzICYgSU9DQl9O
T1dBSVQpCj4gICAgICAgICAgICAgICAgIGl0ZXIuZmxhZ3MgfD0gSU9NQVBfTk9XQUlUOwo+Cj4g
ICAgICAgICB3aGlsZSAoKHJldCA9IGlvbWFwX2l0ZXIoJml0ZXIsIG9wcykpID4gMCkKPiAgICAg
ICAgICAgICAgICAgaXRlci5wcm9jZXNzZWQgPSBpb21hcF93cml0ZV9pdGVyKCZpdGVyLCBpKTsK
PiAtICAgICAgIGlmIChpdGVyLnBvcyA9PSBpb2NiLT5raV9wb3MpCj4gKwo+ICsgICAgICAgaWYg
KHVubGlrZWx5KHJldCA8IDApKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+IC0gICAg
ICAgcmV0dXJuIGl0ZXIucG9zIC0gaW9jYi0+a2lfcG9zOwo+ICsgICAgICAgcmV0ID0gaXRlci5w
b3MgLSBpb2NiLT5raV9wb3M7Cj4gKyAgICAgICBpb2NiLT5raV9wb3MgKz0gcmV0Owo+ICsgICAg
ICAgcmV0dXJuIHJldDsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChpb21hcF9maWxlX2J1ZmZl
cmVkX3dyaXRlKTsKPgo+IGRpZmYgLS1naXQgYS9mcy94ZnMveGZzX2ZpbGUuYyBiL2ZzL3hmcy94
ZnNfZmlsZS5jCj4gaW5kZXggNDMxYzNmZDBlMmI1OTguLmQ1NzQ0M2RiNjMzNjM3IDEwMDY0NAo+
IC0tLSBhL2ZzL3hmcy94ZnNfZmlsZS5jCj4gKysrIGIvZnMveGZzL3hmc19maWxlLmMKPiBAQCAt
NzIwLDggKzcyMCw2IEBAIHhmc19maWxlX2J1ZmZlcmVkX3dyaXRlKAo+ICAgICAgICAgdHJhY2Vf
eGZzX2ZpbGVfYnVmZmVyZWRfd3JpdGUoaW9jYiwgZnJvbSk7Cj4gICAgICAgICByZXQgPSBpb21h
cF9maWxlX2J1ZmZlcmVkX3dyaXRlKGlvY2IsIGZyb20sCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgJnhmc19idWZmZXJlZF93cml0ZV9pb21hcF9vcHMpOwo+IC0gICAgICAgaWYgKGxpa2VseShy
ZXQgPj0gMCkpCj4gLSAgICAgICAgICAgICAgIGlvY2ItPmtpX3BvcyArPSByZXQ7Cj4KPiAgICAg
ICAgIC8qCj4gICAgICAgICAgKiBJZiB3ZSBoaXQgYSBzcGFjZSBsaW1pdCwgdHJ5IHRvIGZyZWUg
dXAgc29tZSBsaW5nZXJpbmcgcHJlYWxsb2NhdGVkCj4gZGlmZiAtLWdpdCBhL2ZzL3pvbmVmcy9m
aWxlLmMgYi9mcy96b25lZnMvZmlsZS5jCj4gaW5kZXggMTMyZjAxZDM0NjFmMTQuLmUyMTJkMDYz
NmY4NDhlIDEwMDY0NAo+IC0tLSBhL2ZzL3pvbmVmcy9maWxlLmMKPiArKysgYi9mcy96b25lZnMv
ZmlsZS5jCj4gQEAgLTY0Myw5ICs2NDMsNyBAQCBzdGF0aWMgc3NpemVfdCB6b25lZnNfZmlsZV9i
dWZmZXJlZF93cml0ZShzdHJ1Y3Qga2lvY2IgKmlvY2IsCj4gICAgICAgICAgICAgICAgIGdvdG8g
aW5vZGVfdW5sb2NrOwo+Cj4gICAgICAgICByZXQgPSBpb21hcF9maWxlX2J1ZmZlcmVkX3dyaXRl
KGlvY2IsIGZyb20sICZ6b25lZnNfd3JpdGVfaW9tYXBfb3BzKTsKPiAtICAgICAgIGlmIChyZXQg
PiAwKQo+IC0gICAgICAgICAgICAgICBpb2NiLT5raV9wb3MgKz0gcmV0Owo+IC0gICAgICAgZWxz
ZSBpZiAocmV0ID09IC1FSU8pCj4gKyAgICAgICBpZiAocmV0ID09IC1FSU8pCj4gICAgICAgICAg
ICAgICAgIHpvbmVmc19pb19lcnJvcihpbm9kZSwgdHJ1ZSk7Cj4KPiAgaW5vZGVfdW5sb2NrOgo+
IC0tCj4gMi4zOS4yCj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
