Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FAE6D72E8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 06:05:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjuOb-0001F1-CE;
	Wed, 05 Apr 2023 04:05:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <smfrench@gmail.com>) id 1pjuOZ-0001Ev-2D
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 04:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TJlfy7j3jMnUpTZd8i2RXdQGxubaR4kSxjiHyHktxQU=; b=JH2HvoNJ3STUisVXj0YpBnL53B
 6tQG1KdVAvbFc9n+Vy5WYfACYrJBaPndt3+vh2of8a0G5fakP4M32Lm2U1wC5hBfp0mv5T6KWITcF
 Fli2FgUtC96/aABOVcyZSzsynf/CZVsLP+H8e6equLtB8+kLCto78zlU29JIfTII799k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TJlfy7j3jMnUpTZd8i2RXdQGxubaR4kSxjiHyHktxQU=; b=ijVZ+Be4LZCu5vlBcvjPI067l8
 1yZ6S+E75FoQriLNe7m7lElhIcT85Eq7J6LmiiXRMonSvj8+lNWIZT4dEz+AdVLbtzNvSvKguxzmH
 QiE9sv30vgDxJvPlbsowWSWbb4kRDZjvKeYJxPr/mWAhK8O08LcM2DDTQATgvO53II7M=;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pjuOW-00FfbV-H2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 04:05:14 +0000
Received: by mail-lf1-f46.google.com with SMTP id y20so45014865lfj.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 21:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680667506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJlfy7j3jMnUpTZd8i2RXdQGxubaR4kSxjiHyHktxQU=;
 b=GBLwfW9UJi4zFmg7y/9EKT5SVpOWVKBcOTg6x2OXZDoySEjA2NqEqCXXNliCGLdrIm
 nANtfragDQ9GodkTcqPEAwnnOqLt5VwYILPmMXwTJFTkSdNjfkKykk8r1Y6VQtyxw4tz
 49QTfWGO301+AXZ/tDP5Os97+TmEQtoTmx7a7D6G9iTjsDFMSK0NXGVLS1XFRV6pXVnF
 Vgwi2jCdR+MWGco8cnyO9eIaxK6aByiWUuxhZp86TQv5vGBeDDUblpJ1ckYg8FnjBo47
 vP04pmkcKH+Z2oHyTnSv5LBe8lrlwt2GBG52teC3ieI2/iHqJRH7hKihvKUPAsZrzDCc
 3clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680667506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJlfy7j3jMnUpTZd8i2RXdQGxubaR4kSxjiHyHktxQU=;
 b=6BOeQsB4o73V3f/ZwbRMKg722V5T3PCH7M1DFvTTAwKIDxxRvzr7E6w6T1fRuwCjXW
 qCLVNmfAap59lb5fcKlznaqBboqwAPp+wVxTzSmy/NWr3RIBt0MCIkvFsXtjNUBQPDs2
 J5yphJVIotFQWfEaz7y7bfkNBY5ZbDwDqZnXMFpogPIGzz6lKtbXek7NLQf01D8ApuPm
 R4aMuy5A28o79ci5ov6vQW6MKjv4RSnO4wjHyKTYi0U67rIyCMsYk63ZtMBSE8Y4P5lY
 t9SLx5J6og3QhcuK0yuAfhq81E4JbCVgzPaYz3xNyeUUi3omuuS9G5oMyXt9Lo0R88H1
 DuzA==
X-Gm-Message-State: AAQBX9f81ZaIIrsSzezcTVPZQ6sYkBP4O/iIx2qzoupGfttvlSU4sNzH
 wmY0yHeEd/f7yhdeO9B2roqUR3ncU1UYjs3wrqE=
X-Google-Smtp-Source: AKy350YUnFw6FnCbM4/rIL7SfmUol3E7+vdFKY2q63D6zsUvp1WRxA+9ht3amnQRmHWnL/rEG8hkq3VPj2+tk7SUk4c=
X-Received: by 2002:ac2:5291:0:b0:4e9:22ff:948d with SMTP id
 q17-20020ac25291000000b004e922ff948dmr1405756lfm.7.1680667505632; Tue, 04 Apr
 2023 21:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230404171411.699655-1-zlang@kernel.org>
 <20230404171411.699655-4-zlang@kernel.org>
 <20230404232159.GB109960@frogsfrogsfrogs>
In-Reply-To: <20230404232159.GB109960@frogsfrogsfrogs>
From: Steve French <smfrench@gmail.com>
Date: Tue, 4 Apr 2023 23:04:53 -0500
Message-ID: <CAH2r5mtmppW-vVdBAnxgH3zsH0b9pMUJyT=s3WTr9dnfwpHrWw@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Steven French On Tue, Apr 4, 2023 at 6:22 PM
    Darrick J. Wong wrote: > > On Wed, Apr 05, 2023 at 01:14:09AM +0800, Zorro
    Lang wrote: > > The fstests supports different kind of fs testing, better
    to cc > > specif [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [smfrench[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.46 listed in list.dnswl.org]
X-Headers-End: 1pjuOW-00FfbV-H2
Subject: Re: [f2fs-dev] [PATCH 3/5] fstests/MAINTAINERS: add supported
 mailing list
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
Cc: brauner@kernel.org, linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Zorro Lang <zlang@kernel.org>, ebiggers@google.com, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 fdmanana@suse.com, ocfs2-devel@oss.oracle.com, jack@suse.com,
 linux-fsdevel@vger.kernel.org, anand.jain@oracle.com,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UmV2aWV3ZWQtYnk6IFN0ZXZlbiBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+CgpPbiBU
dWUsIEFwciA0LCAyMDIzIGF0IDY6MjLigK9QTSBEYXJyaWNrIEouIFdvbmcgPGRqd29uZ0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgQXByIDA1LCAyMDIzIGF0IDAxOjE0OjA5QU0gKzA4
MDAsIFpvcnJvIExhbmcgd3JvdGU6Cj4gPiBUaGUgZnN0ZXN0cyBzdXBwb3J0cyBkaWZmZXJlbnQg
a2luZCBvZiBmcyB0ZXN0aW5nLCBiZXR0ZXIgdG8gY2MKPiA+IHNwZWNpZmljIGZzIG1haWxpbmcg
bGlzdCBmb3Igc3BlY2lmaWMgZnMgdGVzdGluZywgdG8gZ2V0IGJldHRlcgo+ID4gcmV2aWV3aW5n
IHBvaW50cy4gU28gcmVjb3JkIHRoZXNlIG1haWxpbmcgbGlzdHMgYW5kIGZpbGVzIHJlbGF0ZWQK
PiA+IHdpdGggdGhlbSBpbiBNQUlOVEFJTkVSUyBmaWxlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IFpvcnJvIExhbmcgPHpsYW5nQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+Cj4gPiBJZiBzb21lb25l
IG1haWxpbmcgbGlzdCBkb2Vzbid0IHdhbnQgdG8gYmUgaW4gY2MgbGlzdCBvZiByZWxhdGVkIGZz
dGVzdHMKPiA+IHBhdGNoLCBwbGVhc2UgcmVwbHkgdGhpcyBlbWFpbCwgSSdsbCByZW1vdmUgdGhh
dCBsaW5lLgo+ID4KPiA+IE9yIGlmIEkgbWlzc2VkIHNvbWVvbmUgbWFpbGluZyBsaXN0LCBwbGVh
c2UgZmVlbCBmcmVlIHRvIHRlbGwgbWUuCj4gPgo+ID4gVGhhbmtzLAo+ID4gWm9ycm8KPiA+Cj4g
PiAgTUFJTlRBSU5FUlMgfCA3NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiA+IGluZGV4IDA5
YjFhNWEzLi42MjAzNjhjYiAxMDA2NDQKPiA+IC0tLSBhL01BSU5UQUlORVJTCj4gPiArKysgYi9N
QUlOVEFJTkVSUwo+ID4gQEAgLTEwNyw2ICsxMDcsODMgQEAgTWFpbnRhaW5lcnMgTGlzdAo+ID4g
ICAgICAgICBzaG91bGQgc2VuZCBwYXRjaCB0byBmc3Rlc3RzQCBhdCBsZWFzdC4gT3RoZXIgcmVs
ZXZhbnQgbWFpbGluZyBsaXN0Cj4gPiAgICAgICAgIG9yIHJldmlld2VyIG9yIGNvLW1haW50YWlu
ZXIgY2FuIGJlIGluIGNjIGxpc3QuCj4gPgo+ID4gK0JUUkZTCj4gPiArTDogICBsaW51eC1idHJm
c0B2Z2VyLmtlcm5lbC5vcmcKPiA+ICtTOiAgIFN1cHBvcnRlZAo+ID4gK0Y6ICAgdGVzdHMvYnRy
ZnMvCj4gPiArRjogICBjb21tb24vYnRyZnMKPiA+ICsKPiA+ICtDRVBICj4gPiArTDogICBjZXBo
LWRldmVsQHZnZXIua2VybmVsLm9yZwo+ID4gK1M6ICAgU3VwcG9ydGVkCj4gPiArRjogICB0ZXN0
cy9jZXBoLwo+ID4gK0Y6ICAgY29tbW9uL2NlcGgKPiA+ICsKPiA+ICtDSUZTCj4gPiArTDogICBs
aW51eC1jaWZzQHZnZXIua2VybmVsLm9yZwo+ID4gK1M6ICAgU3VwcG9ydGVkCj4gPiArRjogICB0
ZXN0cy9jaWZzCj4gPiArCj4gPiArRVhUNAo+ID4gK0w6ICAgbGludXgtZXh0NEB2Z2VyLmtlcm5l
bC5vcmcKPiA+ICtTOiAgIFN1cHBvcnRlZAo+ID4gK0Y6ICAgdGVzdHMvZXh0NC8KPiA+ICtGOiAg
IGNvbW1vbi9leHQ0Cj4gPiArCj4gPiArRjJGUwo+ID4gK0w6ICAgbGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+ICtTOiAgIFN1cHBvcnRlZAo+ID4gK0Y6ICAgdGVzdHMv
ZjJmcy8KPiA+ICtGOiAgIGNvbW1vbi9mMmZzCj4gPiArCj4gPiArRlNWRVJJVFkKPiA+ICtMOiAg
IGZzdmVyaXR5QGxpc3RzLmxpbnV4LmRldgo+ID4gK1M6ICAgU3VwcG9ydGVkCj4gPiArRjogICBj
b21tb24vdmVyaXR5Cj4gPiArCj4gPiArRlNDUllQVAo+ID4gK0w6ICAgICAgbGludXgtZnNjcnlw
dEB2Z2VyLmtlcm5lbC5vcmcKPiA+ICtTOiAgIFN1cHBvcnRlZAo+ID4gK0Y6ICAgY29tbW9uL2Vu
Y3J5cHQKPiA+ICsKPiA+ICtGUy1JRE1BUFBFRAo+ID4gK0w6ICAgbGludXgtZnNkZXZlbEB2Z2Vy
Lmtlcm5lbC5vcmcKPiA+ICtTOiAgIFN1cHBvcnRlZAo+ID4gK0Y6ICAgc3JjL3Zmcy8KPiA+ICsK
PiA+ICtORlMKPiA+ICtMOiAgIGxpbnV4LW5mc0B2Z2VyLmtlcm5lbC5vcmcKPiA+ICtTOiAgIFN1
cHBvcnRlZAo+ID4gK0Y6ICAgdGVzdHMvbmZzLwo+ID4gK0Y6ICAgY29tbW9uL25mcwo+ID4gKwo+
ID4gK09DRlMyCj4gPiArTDogICBvY2ZzMi1kZXZlbEBvc3Mub3JhY2xlLmNvbQo+ID4gK1M6ICAg
U3VwcG9ydGVkCj4gPiArRjogICB0ZXN0cy9vY2ZzMi8KPiA+ICsKPiA+ICtPVkVSTEFZRlMKPiA+
ICtMOiAgIGxpbnV4LXVuaW9uZnNAdmdlci5rZXJuZWwub3JnCj4gPiArUzogICBTdXBwb3J0ZWQK
PiA+ICtGOiAgIHRlc3RzL292ZXJsYXkKPiA+ICtGOiAgIGNvbW1vbi9vdmVybGF5Cj4gPiArCj4g
PiArVURGCj4gPiArUjogICBKYW4gS2FyYSA8amFja0BzdXNlLmNvbT4KPiA+ICtTOiAgIFN1cHBv
cnRlZAo+ID4gK0Y6ICAgdGVzdHMvdWRmLwo+ID4gKwo+ID4gK1hGUwo+ID4gK0w6ICAgbGludXgt
eGZzQHZnZXIua2VybmVsLm9yZwo+ID4gK1M6ICAgU3VwcG9ydGVkCj4gPiArRjogICBjb21tb24v
ZHVtcAo+ID4gK0Y6ICAgY29tbW9uL2Z1enp5Cj4gPiArRjogICBjb21tb24vaW5qZWN0Cj4gPiAr
RjogICBjb21tb24vcG9wdWxhdGUKPgo+IG5vdGUgdGhhdCBwb3B1bGF0ZSBhbmQgZnV6enkgYXBw
bHkgdG8gZXh0KiBhcyB3ZWxsLgo+Cj4gPiArRjogICBjb21tb24vcmVwYWlyCj4gPiArRjogICBj
b21tb24veGZzCj4gPiArRjogICB0ZXN0cy94ZnMvCj4KPiBPdGhlcndpc2UgbG9va3MgZ29vZCB0
byBtZSwKPgo+IFJldmlld2VkLWJ5OiBEYXJyaWNrIEouIFdvbmcgPGRqd29uZ0BrZXJuZWwub3Jn
Pgo+Cj4gLS1ECj4KPiA+ICsKPiA+ICBBTEwKPiA+ICBNOiAgIFpvcnJvIExhbmcgPHpsYW5nQGtl
cm5lbC5vcmc+Cj4gPiAgTDogICBmc3Rlc3RzQHZnZXIua2VybmVsLm9yZwo+ID4gLS0KPiA+IDIu
MzkuMgo+ID4KCgoKLS0gClRoYW5rcywKClN0ZXZlCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
