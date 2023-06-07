Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B61725B59
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 12:14:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6qBd-000778-60;
	Wed, 07 Jun 2023 10:14:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinpu.wang@ionos.com>) id 1q6qBZ-00076r-4q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 10:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h7De2dV56C4HlWldqRhiqrthNBSi3YmqE+PsGIwemH4=; b=m70ipMEQ3uIoY+CPvNJyiKk3lR
 xBwwc27/wVduTZQ7hRH3gg2n0DzdsiBnockgq7Tv/lQ4dB7KG+vGSQ4oueipnDAJ1A39nEYiI2SVB
 5FD0jznWmTJNjZHV4/IqD0yfZrI+IqgDnF8j8d/xnSd8C7uvdJUNhokq0IW0wO0OeBWQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h7De2dV56C4HlWldqRhiqrthNBSi3YmqE+PsGIwemH4=; b=HBhlZhpKAZ3vi8n067Qp/nG+SS
 hry/K3MfTAneVTOMPsvcv0nhhtTzUY22qHyREEGQc92GaYjpv5lrnnbPGIQ3ggB4v8Eri2VBGi+4Q
 BqfhDWgVR7fTcTsXtC+YWK4Umru4WRxB9qCAn1JVV3AzYQ8L3QQD2B46vfyENgvSKlxE=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6qBW-0007a9-7K for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 10:14:36 +0000
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4f63ea7bfb6so1141211e87.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Jun 2023 03:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ionos.com; s=google; t=1686132867; x=1688724867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7De2dV56C4HlWldqRhiqrthNBSi3YmqE+PsGIwemH4=;
 b=L2b+pIpthJlsZWcyKJQ6DzpvkRgNszgTctr9LnAv9FJyKZwUo71U3J0bF7DB5GDTQ9
 1dKJPG4CPKkRq6e00okcTiZmIcTc7/vyZoQyutWPsfXJ1322Od1WoN7aBMAykc5gDzlg
 CS5N+9rCkGqidrWN5/uYePVxAr39e87iuaefLXwl+Q7CLI/oBDvmJXprqIctddQWuE+a
 rB40z2ve+dPmtzs5aKROlVR7oG9foZM75Rv3ZgB2oKqxqAAsDxmYHuStXDKkEualcDWw
 8xFHsAXDOy68yYYoNNdiL3m7yyhdGPsPu+WLfWmXStSU9ys5jsixg8Yx0pYFY8O46l19
 +qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686132867; x=1688724867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7De2dV56C4HlWldqRhiqrthNBSi3YmqE+PsGIwemH4=;
 b=Li2+VH32b/mo/0G1yu5V8O0+aHUN5TXdUMKbff7TyRvPrQQ3ffPUY4DXhuM6b0AAI/
 Oi8Q0Aq2KZblefgfpguK7+uaG8H+pC/l18UQBotRmUPKT70aPIq6cZrAi1K8AWBndTGH
 LGAHiE/RYFi10YEZMH8kH1pfMmKQdgnQrf0GmccTYhRkNr85VNlf7uLFHSO/vMWxPvSF
 Z0AKW04GrRnoqehxENowiw9LxLEZKx51Vr5HzJE8jtM3eixF4Jz5919aXUaWhcfFS/Q2
 MQvetPOxTVwppNVP5wZv+3DpxeeMHOHANQZGA9V3o3Hons3gElyJjTR3BfxaRhjHU4Ys
 ElXA==
X-Gm-Message-State: AC+VfDxGUWwAL2MxX4yXaE7rfsBP8P7BgunqcwcHIAOe5moeNmFD7vz4
 56avnWsWo+NAIi4UgIPjNNPCSeCRWa0CM2ztHT4EQPfP4e7AGNmBRT87eQ==
X-Google-Smtp-Source: ACHHUZ5Zsd3dLhUTQg2QCup0RdocqPkCkN0n7M2rugZo5XtKl4/VHXYLtkyrTBeTzA0h2H5Q3Eo78GSAj7z6EomEI0Y=
X-Received: by 2002:aa7:c6c8:0:b0:514:7f39:aa82 with SMTP id
 b8-20020aa7c6c8000000b005147f39aa82mr3567915eds.27.1686131019731; Wed, 07 Jun
 2023 02:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-25-hch@lst.de>
In-Reply-To: <20230606073950.225178-25-hch@lst.de>
Date: Wed, 7 Jun 2023 11:43:28 +0200
Message-ID: <CAMGffEnM-XmQWjBu8EmXxFPouH9uQX45gL2PFW5vQJu5OaaYjA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jun 6, 2023 at 9:41 AM Christoph Hellwig <hch@lst.de>
    wrote: > > Stop passing the fmode_t around and just use a simple bool to
   track if > an export is read-only. > > Signed-off-by: Christoph [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1q6qBW-0007a9-7K
Subject: Re: [f2fs-dev] [PATCH 24/31] rnbd-srv: replace sess->open_flags
 with a "bool readonly"
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
From: Jinpu Wang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jinpu Wang <jinpu.wang@ionos.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gNiwgMjAyMyBhdCA5OjQx4oCvQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gU3RvcCBwYXNzaW5nIHRoZSBmbW9kZV90IGFyb3VuZCBhbmQganVz
dCB1c2UgYSBzaW1wbGUgYm9vbCB0byB0cmFjayBpZgo+IGFuIGV4cG9ydCBpcyByZWFkLW9ubHku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KQWNrZWQt
Ynk6IEphY2sgV2FuZyA8amlucHUud2FuZ0Bpb25vcy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvYmxv
Y2svcm5iZC9ybmJkLXNydi1zeXNmcy5jIHwgIDMgKy0tCj4gIGRyaXZlcnMvYmxvY2svcm5iZC9y
bmJkLXNydi5jICAgICAgIHwgMTUgKysrKysrKy0tLS0tLS0tCj4gIGRyaXZlcnMvYmxvY2svcm5i
ZC9ybmJkLXNydi5oICAgICAgIHwgIDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svcm5i
ZC9ybmJkLXNydi1zeXNmcy5jIGIvZHJpdmVycy9ibG9jay9ybmJkL3JuYmQtc3J2LXN5c2ZzLmMK
PiBpbmRleCBkNWQ5MjY3ZTFmYTVlNC4uZWJkOTU3NzFjODVlYzcgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ibG9jay9ybmJkL3JuYmQtc3J2LXN5c2ZzLmMKPiArKysgYi9kcml2ZXJzL2Jsb2NrL3Ju
YmQvcm5iZC1zcnYtc3lzZnMuYwo+IEBAIC04OCw4ICs4OCw3IEBAIHN0YXRpYyBzc2l6ZV90IHJl
YWRfb25seV9zaG93KHN0cnVjdCBrb2JqZWN0ICprb2JqLCBzdHJ1Y3Qga29ial9hdHRyaWJ1dGUg
KmF0dHIsCj4KPiAgICAgICAgIHNlc3NfZGV2ID0gY29udGFpbmVyX29mKGtvYmosIHN0cnVjdCBy
bmJkX3Nydl9zZXNzX2Rldiwga29iaik7Cj4KPiAtICAgICAgIHJldHVybiBzeXNmc19lbWl0KHBh
Z2UsICIlZFxuIiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICEoc2Vzc19kZXYtPm9wZW5f
ZmxhZ3MgJiBGTU9ERV9XUklURSkpOwo+ICsgICAgICAgcmV0dXJuIHN5c2ZzX2VtaXQocGFnZSwg
IiVkXG4iLCBzZXNzX2Rldi0+cmVhZG9ubHkpOwo+ICB9Cj4KPiAgc3RhdGljIHN0cnVjdCBrb2Jq
X2F0dHJpYnV0ZSBybmJkX3Nydl9kZXZfc2Vzc2lvbl9yb19hdHRyID0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ibG9jay9ybmJkL3JuYmQtc3J2LmMgYi9kcml2ZXJzL2Jsb2NrL3JuYmQvcm5iZC1z
cnYuYwo+IGluZGV4IDI5ZDU2MDQ3MmQwNWJhLi5iNjgwMDcxMzQyYjg5OCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2Jsb2NrL3JuYmQvcm5iZC1zcnYuYwo+ICsrKyBiL2RyaXZlcnMvYmxvY2svcm5i
ZC9ybmJkLXNydi5jCj4gQEAgLTIyMiw3ICsyMjIsNyBAQCB2b2lkIHJuYmRfZGVzdHJveV9zZXNz
X2RldihzdHJ1Y3Qgcm5iZF9zcnZfc2Vzc19kZXYgKnNlc3NfZGV2LCBib29sIGtlZXBfaWQpCj4g
ICAgICAgICBibGtkZXZfcHV0KHNlc3NfZGV2LT5iZGV2LCBOVUxMKTsKPiAgICAgICAgIG11dGV4
X2xvY2soJnNlc3NfZGV2LT5kZXYtPmxvY2spOwo+ICAgICAgICAgbGlzdF9kZWwoJnNlc3NfZGV2
LT5kZXZfbGlzdCk7Cj4gLSAgICAgICBpZiAoc2Vzc19kZXYtPm9wZW5fZmxhZ3MgJiBGTU9ERV9X
UklURSkKPiArICAgICAgIGlmICghc2Vzc19kZXYtPnJlYWRvbmx5KQo+ICAgICAgICAgICAgICAg
ICBzZXNzX2Rldi0+ZGV2LT5vcGVuX3dyaXRlX2NudC0tOwo+ICAgICAgICAgbXV0ZXhfdW5sb2Nr
KCZzZXNzX2Rldi0+ZGV2LT5sb2NrKTsKPgo+IEBAIC01NjEsNyArNTYxLDcgQEAgc3RhdGljIHZv
aWQgcm5iZF9zcnZfZmlsbF9tc2dfb3Blbl9yc3Aoc3RydWN0IHJuYmRfbXNnX29wZW5fcnNwICpy
c3AsCj4gIHN0YXRpYyBzdHJ1Y3Qgcm5iZF9zcnZfc2Vzc19kZXYgKgo+ICBybmJkX3Nydl9jcmVh
dGVfc2V0X3Nlc3NfZGV2KHN0cnVjdCBybmJkX3Nydl9zZXNzaW9uICpzcnZfc2VzcywKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qgcm5iZF9tc2dfb3BlbiAqb3Bl
bl9tc2csCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGJsb2NrX2Rldmlj
ZSAqYmRldiwgZm1vZGVfdCBvcGVuX2ZsYWdzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGJvb2wgcmVhZG9ubHksCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJuYmRfc3J2X2RldiAqc3J2X2RldikKPiAgewo+
ICAgICAgICAgc3RydWN0IHJuYmRfc3J2X3Nlc3NfZGV2ICpzZGV2ID0gcm5iZF9zZXNzX2Rldl9h
bGxvYyhzcnZfc2Vzcyk7Cj4gQEAgLTU3Niw3ICs1NzYsNyBAQCBybmJkX3Nydl9jcmVhdGVfc2V0
X3Nlc3NfZGV2KHN0cnVjdCBybmJkX3Nydl9zZXNzaW9uICpzcnZfc2VzcywKPiAgICAgICAgIHNk
ZXYtPmJkZXYgICAgICAgICAgICAgID0gYmRldjsKPiAgICAgICAgIHNkZXYtPnNlc3MgICAgICAg
ICAgICAgID0gc3J2X3Nlc3M7Cj4gICAgICAgICBzZGV2LT5kZXYgICAgICAgICAgICAgICA9IHNy
dl9kZXY7Cj4gLSAgICAgICBzZGV2LT5vcGVuX2ZsYWdzICAgICAgICA9IG9wZW5fZmxhZ3M7Cj4g
KyAgICAgICBzZGV2LT5yZWFkb25seSAgICAgICAgICA9IHJlYWRvbmx5Owo+ICAgICAgICAgc2Rl
di0+YWNjZXNzX21vZGUgICAgICAgPSBvcGVuX21zZy0+YWNjZXNzX21vZGU7Cj4KPiAgICAgICAg
IHJldHVybiBzZGV2Owo+IEBAIC02ODEsMTMgKzY4MSwxMiBAQCBzdGF0aWMgaW50IHByb2Nlc3Nf
bXNnX29wZW4oc3RydWN0IHJuYmRfc3J2X3Nlc3Npb24gKnNydl9zZXNzLAo+ICAgICAgICAgc3Ry
dWN0IHJuYmRfc3J2X3Nlc3NfZGV2ICpzcnZfc2Vzc19kZXY7Cj4gICAgICAgICBjb25zdCBzdHJ1
Y3Qgcm5iZF9tc2dfb3BlbiAqb3Blbl9tc2cgPSBtc2c7Cj4gICAgICAgICBzdHJ1Y3QgYmxvY2tf
ZGV2aWNlICpiZGV2Owo+IC0gICAgICAgZm1vZGVfdCBvcGVuX2ZsYWdzOwo+ICsgICAgICAgZm1v
ZGVfdCBvcGVuX2ZsYWdzID0gRk1PREVfUkVBRDsKPiAgICAgICAgIGNoYXIgKmZ1bGxfcGF0aDsK
PiAgICAgICAgIHN0cnVjdCBybmJkX21zZ19vcGVuX3JzcCAqcnNwID0gZGF0YTsKPgo+ICAgICAg
ICAgdHJhY2VfcHJvY2Vzc19tc2dfb3BlbihzcnZfc2Vzcywgb3Blbl9tc2cpOwo+Cj4gLSAgICAg
ICBvcGVuX2ZsYWdzID0gRk1PREVfUkVBRDsKPiAgICAgICAgIGlmIChvcGVuX21zZy0+YWNjZXNz
X21vZGUgIT0gUk5CRF9BQ0NFU1NfUk8pCj4gICAgICAgICAgICAgICAgIG9wZW5fZmxhZ3MgfD0g
Rk1PREVfV1JJVEU7Cj4KPiBAQCAtNzM2LDkgKzczNSw5IEBAIHN0YXRpYyBpbnQgcHJvY2Vzc19t
c2dfb3BlbihzdHJ1Y3Qgcm5iZF9zcnZfc2Vzc2lvbiAqc3J2X3Nlc3MsCj4gICAgICAgICAgICAg
ICAgIGdvdG8gYmxrZGV2X3B1dDsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgc3J2X3Nlc3NfZGV2
ID0gcm5iZF9zcnZfY3JlYXRlX3NldF9zZXNzX2RldihzcnZfc2Vzcywgb3Blbl9tc2csCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiZGV2LCBv
cGVuX2ZsYWdzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3J2X2Rldik7Cj4gKyAgICAgICBzcnZfc2Vzc19kZXYgPSBybmJkX3Nydl9jcmVh
dGVfc2V0X3Nlc3NfZGV2KHNydl9zZXNzLCBvcGVuX21zZywgYmRldiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG9wZW5fbXNnLT5hY2Nlc3NfbW9kZSA9PSBSTkJEX0FDQ0VTU19S
TywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNydl9kZXYpOwo+ICAgICAgICAg
aWYgKElTX0VSUihzcnZfc2Vzc19kZXYpKSB7Cj4gICAgICAgICAgICAgICAgIHByX2VycigiT3Bl
bmluZyBkZXZpY2UgJyVzJyBvbiBzZXNzaW9uICVzIGZhaWxlZCwgY3JlYXRpbmcgc2Vzc19kZXYg
ZmFpbGVkLCBlcnI6ICVsZFxuIiwKPiAgICAgICAgICAgICAgICAgICAgICAgIGZ1bGxfcGF0aCwg
c3J2X3Nlc3MtPnNlc3NuYW1lLCBQVFJfRVJSKHNydl9zZXNzX2RldikpOwo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2Jsb2NrL3JuYmQvcm5iZC1zcnYuaCBiL2RyaXZlcnMvYmxvY2svcm5iZC9ybmJk
LXNydi5oCj4gaW5kZXggZjU5NjJmZDMxZDYyZTQuLjc2MDc3YTlkYjNkZDU1IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvYmxvY2svcm5iZC9ybmJkLXNydi5oCj4gKysrIGIvZHJpdmVycy9ibG9jay9y
bmJkL3JuYmQtc3J2LmgKPiBAQCAtNTIsNyArNTIsNyBAQCBzdHJ1Y3Qgcm5iZF9zcnZfc2Vzc19k
ZXYgewo+ICAgICAgICAgc3RydWN0IGtvYmplY3QgICAgICAgICAgICAgICAgICBrb2JqOwo+ICAg
ICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2VfaWQ7Cj4gICAgICAg
ICBib29sICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtlZXBfaWQ7Cj4gLSAgICAgICBmbW9k
ZV90ICAgICAgICAgICAgICAgICAgICAgICAgIG9wZW5fZmxhZ3M7Cj4gKyAgICAgICBib29sICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlYWRvbmx5Owo+ICAgICAgICAgc3RydWN0IGtyZWYg
ICAgICAgICAgICAgICAgICAgICBrcmVmOwo+ICAgICAgICAgc3RydWN0IGNvbXBsZXRpb24gICAg
ICAgICAgICAgICAqZGVzdHJveV9jb21wOwo+ICAgICAgICAgY2hhciAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXRobmFtZVtOQU1FX01BWF07Cj4gLS0KPiAyLjM5LjIKPgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
