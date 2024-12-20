Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F302C9F9753
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Dec 2024 18:05:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tOgQw-0002cZ-IU;
	Fri, 20 Dec 2024 17:05:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chullee@google.com>) id 1tOgQv-0002cS-07
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 17:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=trth5w1O8mC4rlrxIexCQuBs8u5MzrMrT7CMiMQfmmA=; b=mSJ1KlULBexd1031vGlKcDRONN
 MSDKpqUt1pVOWliGhzR2+MrZIcLZw3Y1C5iTZT7cy7/SN/ErWH+tZYVUzYLrythnNgLqH9hP07HOe
 ppdHr8M53MJD6fG0VpTQT9N8A/vsepuAoZ+qzTZlmICIs9YRDBozfb2mMsmKCfbB6tnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=trth5w1O8mC4rlrxIexCQuBs8u5MzrMrT7CMiMQfmmA=; b=QyP6NqGQmvWpqllLUvKpSyzTWT
 oyZXlheLzFCGfDac3u7U8dpAV/Z1jbEOHfTFUvYuDNOleOGW26BZmatPO79Fe0SI4j6ZUU+2PLAie
 VmiBJD9shEaMwgTvepAvTOfpA7QN627kHFdX723YLfjvEDoPnO23zcB92W+DYExdsgsw=;
Received: from mail-qt1-f174.google.com ([209.85.160.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tOgQt-0001UX-Cc for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 17:05:00 +0000
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4678c9310afso267021cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Dec 2024 09:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1734714293; x=1735319093;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=trth5w1O8mC4rlrxIexCQuBs8u5MzrMrT7CMiMQfmmA=;
 b=Dn1h1AIOXxVFKzdSZy5NmgcJC8w5Fi+sucMrDWQv1dnWo9P2x8ooGBFFe3W9K+TNGM
 LwGCgdMwsnVTDrPz8NsfJ9ztFP90OXTHNATNNKnO5MO+8OP1FBRye4LCO2rKqMLXdupj
 a/Ifa5AymQuc6TANPk6HdlivCCk21noZQcTX987vSf+5+q3lsxdX2lJF3wwoBF7+4LDw
 fc4/BvTYHzhaiSqb6zt1HJTnP2FUjOsVb1rKK644mES7LSGXM2OUYACjuPLCMHOTKUwc
 biQd5GEjZnn4YI4VFK3CxxTYoDpRURfwspbizgS6uCx1WWJ0DjGkBkhxxfu9PJHAx/KM
 SkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734714293; x=1735319093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=trth5w1O8mC4rlrxIexCQuBs8u5MzrMrT7CMiMQfmmA=;
 b=AhvBEkRhgN6PnDtBJoRP2MwPI9uZ9ZTEdym5u+RfK+fRgTa+HT/eqQFsu+htmKxLqo
 EkJNbMjyYg2HZ1DpERHy1GebW3fhcXY2VktnPUKRnjYYbZhZSzIBKotGMQfuPTqOQSfv
 E4b5x3tPUwxFhgBnKV80kGR1SiB8ghu5IiYH81a5tSlWCaXrlS87W4mUqthDVvReHbzG
 gUMV+vpCJQaZtxr7PhXNSBMzz7EMQVaqMz0NG+DvxtA4Xg1kzOemFjLGwVfAhUvGjFlx
 4v7gqk9C0nMvlYEho3lRoNgiY+z5q3b3PoVWpTik7Vz1QWC/wIxQaarCfLsv+c/KJ5Qg
 959w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX23JD4vE3qZg3n+GgkW8Hk/iVeVQrm0ChL8tiU+q8DFeYB9JosTYpVjtxn/XtFljkgoArj0VldMSfIz7psutXa@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzSmUlcmajuvXyxmytrEg0U8i7Er1iJWSPwLtrwZ/glnAOL9AHn
 vvQpc6WcKQOFdhogaP8TQBidhuZzAF5xdgsmZCUfSy4Z++09ZPM7TdBBAcciRmaHZ2tIIs3RXzk
 RTiU73Xc0XwrwP4l+AxncBiFkQCmq///RyMYvZifIs+Vn3RjtCw==
X-Gm-Gg: ASbGncuv62FuBGthPqeVmlRSLSOdXr4Ew/xHH+aBge+CBofQVUVyy1UuSL/ab/WKosf
 ehmU+t9iWLaGW+HUNX1g90q3qIVRz8JN+JO4DpqxFDWFRJExQ4WyB04hZAS81iACkCUcq
X-Google-Smtp-Source: AGHT+IFL/Kr5fRoHQIHeSQo/1vQpEOEZD2kYpXqg+y5XDyffTcDmFuqGIJa+MbVe0uab6A1FNJlsD0/T/VeTcdoVaiM=
X-Received: by 2002:ac8:5751:0:b0:461:358e:d635 with SMTP id
 d75a77b69052e-46a4a9a37ddmr4018731cf.18.1734714292970; Fri, 20 Dec 2024
 09:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20241217075552.1167994-1-chullee@google.com>
 <31e9c60b-0fd1-4d98-baf9-cf02e44c367d@kernel.org>
 <CALBjLoBxtMQjKQXdzyt8x75--mT9nJZnoEpDArL56fg8JRPdTg@mail.gmail.com>
 <9799a430-c1d9-4f04-9a8c-ad88fade8351@kernel.org>
In-Reply-To: <9799a430-c1d9-4f04-9a8c-ad88fade8351@kernel.org>
Date: Fri, 20 Dec 2024 09:04:42 -0800
Message-ID: <CALBjLoDHwKLgj3-uF-Tmmy=2MGne5pCPGQFYtUfXvSwa0V+_Nw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Dec 20, 2024 at 5:25 AM Chao Yu <chao@kernel.org>
    wrote: > > On 2024/12/20 12:59, Daniel Lee wrote: > > On Thu, Dec 19, 2024
    at 5:29 AM Chao Yu <chao@kernel.org> wrote: > >> > >> Hi Daniel [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.174 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [209.85.160.174 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.160.174 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1tOgQt-0001UX-Cc
Subject: Re: [f2fs-dev] [PATCH] f2fs: Introduce linear search for dentries
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
From: Daniel Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Lee <chullee@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBEZWMgMjAsIDIwMjQgYXQgNToyNeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzEyLzIwIDEyOjU5LCBEYW5pZWwgTGVlIHdyb3RlOgo+ID4g
T24gVGh1LCBEZWMgMTksIDIwMjQgYXQgNToyOeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPj4KPiA+PiBIaSBEYW5pZWwsCj4gPj4KPiA+PiBPbiAyMDI0LzEyLzE3IDE1
OjU1LCBEYW5pZWwgTGVlIHdyb3RlOgo+ID4+PiBUaGlzIHBhdGNoIGFkZHJlc3NlcyBhbiBpc3N1
ZSB3aGVyZSBzb21lIGZpbGVzIGluIGNhc2UtaW5zZW5zaXRpdmUKPiA+Pj4gZGlyZWN0b3JpZXMg
YmVjb21lIGluYWNjZXNzaWJsZSBkdWUgdG8gY2hhbmdlcyBpbiBob3cgdGhlIGtlcm5lbCBmdW5j
dGlvbiwKPiA+Pj4gdXRmOF9jYXNlZm9sZCgpLCBnZW5lcmF0ZXMgY2FzZS1mb2xkZWQgc3RyaW5n
cyBmcm9tIHRoZSBjb21taXQgNWMyNmQyZjFkM2Y1Cj4gPj4+ICgidW5pY29kZTogRG9uJ3Qgc3Bl
Y2lhbCBjYXNlIGlnbm9yYWJsZSBjb2RlIHBvaW50cyIpLgo+ID4+Pgo+ID4+PiBGMkZTIHVzZXMg
dGhlc2UgY2FzZS1mb2xkZWQgbmFtZXMgdG8gY2FsY3VsYXRlIGhhc2ggdmFsdWVzIGZvciBsb2Nh
dGluZwo+ID4+PiBkZW50cmllcyBhbmQgc3RvcmVzIHRoZW0gb24gZGlzay4gU2luY2UgdXRmOF9j
YXNlZm9sZCgpIGNhbiBwcm9kdWNlCj4gPj4+IGRpZmZlcmVudCBvdXRwdXQgYWNyb3NzIGtlcm5l
bCB2ZXJzaW9ucywgc3RvcmVkIGhhc2ggdmFsdWVzIGFuZCBuZXdseQo+ID4+PiBjYWxjdWxhdGVk
IGhhc2ggdmFsdWVzIG1heSBkaWZmZXIuIFRoaXMgcmVzdWx0cyBpbiBhZmZlY3RlZCBmaWxlcyBu
bwo+ID4+PiBsb25nZXIgYmVpbmcgZm91bmQgdmlhIHRoZSBoYXNoLWJhc2VkIGxvb2t1cC4KPiA+
Pj4KPiA+Pj4gVG8gcmVzb2x2ZSB0aGlzLCB0aGUgcGF0Y2ggaW50cm9kdWNlcyBhIGxpbmVhciBz
ZWFyY2ggZmFsbGJhY2suCj4gPj4+IElmIHRoZSBpbml0aWFsIGhhc2gtYmFzZWQgc2VhcmNoIGZh
aWxzLCBGMkZTIHdpbGwgc2VxdWVudGlhbGx5IHNjYW4gdGhlCj4gPj4+IGRpcmVjdG9yeSBlbnRy
aWVzLgo+ID4+Pgo+ID4+Cj4gPj4gTmVlZCBhIGZpeGVzIGxpbmU/Cj4gPgo+ID4gVGhhbmtzLiBJ
IHdpbGwgYWRkIHRoZSBjb21taXQgNWMyNmQyZjFkM2Y1IHRvIHRoZSBGaXhlczoKPiA+Cj4gPj4K
PiA+Pj4gTGluazogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0y
MTk1ODYKPiA+Pj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIExlZSA8Y2h1bGxlZUBnb29nbGUuY29t
Pgo+ID4+PiAtLS0KPiA+Pj4gICAgZnMvZjJmcy9kaXIuYyAgICB8IDM4ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tCj4gPj4+ICAgIGZzL2YyZnMvZjJmcy5oICAgfCAgNiAr
KysrLS0KPiA+Pj4gICAgZnMvZjJmcy9pbmxpbmUuYyB8ICA1ICsrKy0tCj4gPj4+ICAgIDMgZmls
ZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2Rpci5jIGIvZnMvZjJmcy9kaXIuYwo+ID4+PiBpbmRleCA0
N2E1YzgwNmNmMTYuLmE4NWQxOWI0ZTE3OCAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJmcy9kaXIu
Ywo+ID4+PiArKysgYi9mcy9mMmZzL2Rpci5jCj4gPj4+IEBAIC0xNzUsNyArMTc1LDggQEAgc3Rh
dGljIHVuc2lnbmVkIGxvbmcgZGlyX2Jsb2NrX2luZGV4KHVuc2lnbmVkIGludCBsZXZlbCwKPiA+
Pj4gICAgc3RhdGljIHN0cnVjdCBmMmZzX2Rpcl9lbnRyeSAqZmluZF9pbl9ibG9jayhzdHJ1Y3Qg
aW5vZGUgKmRpciwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBw
YWdlICpkZW50cnlfcGFnZSwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBmMmZzX2ZpbGVuYW1lICpmbmFtZSwKPiA+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50ICptYXhfc2xvdHMpCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGludCAqbWF4X3Nsb3RzLAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBib29sIHVzZV9oYXNoKQo+ID4+PiAgICB7Cj4gPj4+ICAgICAgICBzdHJ1Y3QgZjJmc19kZW50
cnlfYmxvY2sgKmRlbnRyeV9ibGs7Cj4gPj4+ICAgICAgICBzdHJ1Y3QgZjJmc19kZW50cnlfcHRy
IGQ7Cj4gPj4+IEBAIC0xODMsNyArMTg0LDcgQEAgc3RhdGljIHN0cnVjdCBmMmZzX2Rpcl9lbnRy
eSAqZmluZF9pbl9ibG9jayhzdHJ1Y3QgaW5vZGUgKmRpciwKPiA+Pj4gICAgICAgIGRlbnRyeV9i
bGsgPSAoc3RydWN0IGYyZnNfZGVudHJ5X2Jsb2NrICopcGFnZV9hZGRyZXNzKGRlbnRyeV9wYWdl
KTsKPiA+Pj4KPiA+Pj4gICAgICAgIG1ha2VfZGVudHJ5X3B0cl9ibG9jayhkaXIsICZkLCBkZW50
cnlfYmxrKTsKPiA+Pj4gLSAgICAgcmV0dXJuIGYyZnNfZmluZF90YXJnZXRfZGVudHJ5KCZkLCBm
bmFtZSwgbWF4X3Nsb3RzKTsKPiA+Pj4gKyAgICAgcmV0dXJuIGYyZnNfZmluZF90YXJnZXRfZGVu
dHJ5KCZkLCBmbmFtZSwgbWF4X3Nsb3RzLCB1c2VfaGFzaCk7Cj4gPj4+ICAgIH0KPiA+Pj4KPiA+
Pj4gICAgc3RhdGljIGlubGluZSBpbnQgZjJmc19tYXRjaF9uYW1lKGNvbnN0IHN0cnVjdCBpbm9k
ZSAqZGlyLAo+ID4+PiBAQCAtMjA4LDcgKzIwOSw4IEBAIHN0YXRpYyBpbmxpbmUgaW50IGYyZnNf
bWF0Y2hfbmFtZShjb25zdCBzdHJ1Y3QgaW5vZGUgKmRpciwKPiA+Pj4gICAgfQo+ID4+Pgo+ID4+
PiAgICBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmYyZnNfZmluZF90YXJnZXRfZGVudHJ5KGNvbnN0
IHN0cnVjdCBmMmZzX2RlbnRyeV9wdHIgKmQsCj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgZjJmc19maWxlbmFtZSAqZm5hbWUsIGludCAqbWF4X3Nsb3RzKQo+ID4+PiAr
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lLCBp
bnQgKm1heF9zbG90cywKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGJvb2wgdXNlX2hhc2gp
Cj4gPj4+ICAgIHsKPiA+Pj4gICAgICAgIHN0cnVjdCBmMmZzX2Rpcl9lbnRyeSAqZGU7Cj4gPj4+
ICAgICAgICB1bnNpZ25lZCBsb25nIGJpdF9wb3MgPSAwOwo+ID4+PiBAQCAtMjMxLDcgKzIzMyw3
IEBAIHN0cnVjdCBmMmZzX2Rpcl9lbnRyeSAqZjJmc19maW5kX3RhcmdldF9kZW50cnkoY29uc3Qg
c3RydWN0IGYyZnNfZGVudHJ5X3B0ciAqZCwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKPiA+Pj4gICAgICAgICAgICAgICAgfQo+ID4+Pgo+ID4+PiAtICAgICAgICAgICAg
IGlmIChkZS0+aGFzaF9jb2RlID09IGZuYW1lLT5oYXNoKSB7Cj4gPj4+ICsgICAgICAgICAgICAg
aWYgKCF1c2VfaGFzaCB8fCBkZS0+aGFzaF9jb2RlID09IGZuYW1lLT5oYXNoKSB7Cj4gPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgcmVzID0gZjJmc19tYXRjaF9uYW1lKGQtPmlub2RlLCBmbmFt
ZSwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZC0+
ZmlsZW5hbWVbYml0X3Bvc10sCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxlMTZfdG9fY3B1KGRlLT5uYW1lX2xlbikpOwo+ID4+PiBAQCAtMjU4LDEx
ICsyNjAsMTIgQEAgc3RydWN0IGYyZnNfZGlyX2VudHJ5ICpmMmZzX2ZpbmRfdGFyZ2V0X2RlbnRy
eShjb25zdCBzdHJ1Y3QgZjJmc19kZW50cnlfcHRyICpkLAo+ID4+PiAgICBzdGF0aWMgc3RydWN0
IGYyZnNfZGlyX2VudHJ5ICpmaW5kX2luX2xldmVsKHN0cnVjdCBpbm9kZSAqZGlyLAo+ID4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbGV2ZWws
Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCBmMmZzX2ZpbGVuYW1lICpmbmFtZSwKPiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqKnJlc19wYWdlKQo+ID4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwYWdlICoqcmVzX3BhZ2UsCj4gPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCB1c2VfaGFzaCkKPiA+Pj4gICAg
ewo+ID4+PiAgICAgICAgaW50IHMgPSBHRVRfREVOVFJZX1NMT1RTKGZuYW1lLT5kaXNrX25hbWUu
bGVuKTsKPiA+Pj4gICAgICAgIHVuc2lnbmVkIGludCBuYnVja2V0LCBuYmxvY2s7Cj4gPj4+IC0g
ICAgIHVuc2lnbmVkIGludCBiaWR4LCBlbmRfYmxvY2s7Cj4gPj4+ICsgICAgIHVuc2lnbmVkIGlu
dCBiaWR4LCBlbmRfYmxvY2ssIGJ1Y2tldF9ubzsKPiA+Pj4gICAgICAgIHN0cnVjdCBwYWdlICpk
ZW50cnlfcGFnZTsKPiA+Pj4gICAgICAgIHN0cnVjdCBmMmZzX2Rpcl9lbnRyeSAqZGUgPSBOVUxM
Owo+ID4+PiAgICAgICAgcGdvZmZfdCBuZXh0X3Bnb2ZzOwo+ID4+PiBAQCAtMjcyLDggKzI3NSwx
MSBAQCBzdGF0aWMgc3RydWN0IGYyZnNfZGlyX2VudHJ5ICpmaW5kX2luX2xldmVsKHN0cnVjdCBp
bm9kZSAqZGlyLAo+ID4+PiAgICAgICAgbmJ1Y2tldCA9IGRpcl9idWNrZXRzKGxldmVsLCBGMkZT
X0koZGlyKS0+aV9kaXJfbGV2ZWwpOwo+ID4+PiAgICAgICAgbmJsb2NrID0gYnVja2V0X2Jsb2Nr
cyhsZXZlbCk7Cj4gPj4+Cj4gPj4+ICsgICAgIGJ1Y2tldF9ubyA9IHVzZV9oYXNoID8gbGUzMl90
b19jcHUoZm5hbWUtPmhhc2gpICUgbmJ1Y2tldCA6IDA7Cj4gPj4+ICsKPiA+Pj4gK3N0YXJ0X2Zp
bmRfYnVja2V0Ogo+ID4+PiAgICAgICAgYmlkeCA9IGRpcl9ibG9ja19pbmRleChsZXZlbCwgRjJG
U19JKGRpciktPmlfZGlyX2xldmVsLAo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxlMzJfdG9fY3B1KGZuYW1lLT5oYXNoKSAlIG5idWNrZXQpOwo+ID4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJ1Y2tldF9ubyk7Cj4gPj4+ICAgICAgICBlbmRfYmxvY2sgPSBiaWR4
ICsgbmJsb2NrOwo+ID4+Pgo+ID4+PiAgICAgICAgd2hpbGUgKGJpZHggPCBlbmRfYmxvY2spIHsK
PiA+Pj4gQEAgLTI5MCw3ICsyOTYsNyBAQCBzdGF0aWMgc3RydWN0IGYyZnNfZGlyX2VudHJ5ICpm
aW5kX2luX2xldmVsKHN0cnVjdCBpbm9kZSAqZGlyLAo+ID4+PiAgICAgICAgICAgICAgICAgICAg
ICAgIH0KPiA+Pj4gICAgICAgICAgICAgICAgfQo+ID4+Pgo+ID4+PiAtICAgICAgICAgICAgIGRl
ID0gZmluZF9pbl9ibG9jayhkaXIsIGRlbnRyeV9wYWdlLCBmbmFtZSwgJm1heF9zbG90cyk7Cj4g
Pj4+ICsgICAgICAgICAgICAgZGUgPSBmaW5kX2luX2Jsb2NrKGRpciwgZGVudHJ5X3BhZ2UsIGZu
YW1lLCAmbWF4X3Nsb3RzLCB1c2VfaGFzaCk7Cj4gPj4+ICAgICAgICAgICAgICAgIGlmIChJU19F
UlIoZGUpKSB7Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgKnJlc19wYWdlID0gRVJSX0NB
U1QoZGUpOwo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgIGRlID0gTlVMTDsKPiA+Pj4gQEAg
LTMwNyw2ICszMTMsOSBAQCBzdGF0aWMgc3RydWN0IGYyZnNfZGlyX2VudHJ5ICpmaW5kX2luX2xl
dmVsKHN0cnVjdCBpbm9kZSAqZGlyLAo+ID4+PiAgICAgICAgICAgICAgICBiaWR4Kys7Cj4gPj4+
ICAgICAgICB9Cj4gPj4+Cj4gPj4+ICsgICAgIGlmICghdXNlX2hhc2ggJiYgIWRlICYmICsrYnVj
a2V0X25vIDwgbmJ1Y2tldCkKPiA+Pj4gKyAgICAgICAgICAgICBnb3RvIHN0YXJ0X2ZpbmRfYnVj
a2V0Owo+ID4+PiArCj4gPj4+ICAgICAgICBpZiAoIWRlICYmIHJvb20gJiYgRjJGU19JKGRpcikt
PmNoYXNoICE9IGZuYW1lLT5oYXNoKSB7Cj4gPj4KPiA+PiBEbyB3ZSBuZWVkIHRvIGF2b2lkIGFj
Y2Vzc2luZyBvciBhc3NpZ25pbmcgaGFzaCBpZiB1c2VfaGFzaCBpcyBmYWxzZT8KPiA+Pgo+ID4K
PiA+IElzIGl0IHN0aWxsIHdvcnRoIGtlZXBpbmcgdGhlIGhhc2ggZm9yIHRoZSBjcmVhdGlvbiBp
ZiBib3RoIGhhc2gtYmFzZWQKPiA+IGFuZCBsaW5lYXIgc2VhcmNoZXMgZmFpbGVkPwo+Cj4gSXQg
bmVlZHMgdG8gYmUga2VwdCBmb3IgaGFzaC1iYXNlZCBzZWFyY2hpbmcgZmFpbHVyZT8gc2luY2Ug
aXQgd2FzIGFkZGVkIHRvCj4gZW5oYW5jZSBwZXJmb3JtYW5jZSBvZiBmaWxlIGNyZWF0aW9uOgo+
IC0gb3BlbiguLi4sIE9fQ1JFQVQpCj4gICAtIGYyZnNfbG9va3VwCj4gICA6IGRpZG4ndCBmaW5k
IHRhcmdldCBkaXJlbnQsIHRoZW4sIHJlY29yZCBsYXN0IGNoYXNoICYgY2xldmVsCj4gICAtIGYy
ZnNfY3JlYXRlCj4gICA6IGNyZWF0ZSBkaXJlbnQgaW4gY2xldmVsIGJ1Y2tldCBvbmNlIGNoYXNo
IG1hdGNoZXMKPgoKSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQgYW5kIEkgd2lsbCByZXZpc2UgaXQg
YWNjb3JkaW5nbHkuCgo+IFRoYW5rcywKPgo+ID4KPiA+PiBUaGFua3MsCj4gPj4KPiA+Pj4gICAg
ICAgICAgICAgICAgRjJGU19JKGRpciktPmNoYXNoID0gZm5hbWUtPmhhc2g7Cj4gPj4+ICAgICAg
ICAgICAgICAgIEYyRlNfSShkaXIpLT5jbGV2ZWwgPSBsZXZlbDsKPiA+Pj4gQEAgLTMyMywxMSAr
MzMyLDEzIEBAIHN0cnVjdCBmMmZzX2Rpcl9lbnRyeSAqX19mMmZzX2ZpbmRfZW50cnkoc3RydWN0
IGlub2RlICpkaXIsCj4gPj4+ICAgICAgICBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmRlID0gTlVM
TDsKPiA+Pj4gICAgICAgIHVuc2lnbmVkIGludCBtYXhfZGVwdGg7Cj4gPj4+ICAgICAgICB1bnNp
Z25lZCBpbnQgbGV2ZWw7Cj4gPj4+ICsgICAgIGJvb2wgdXNlX2hhc2ggPSB0cnVlOwo+ID4+Pgo+
ID4+PiAgICAgICAgKnJlc19wYWdlID0gTlVMTDsKPiA+Pj4KPiA+Pj4gK3N0YXJ0X2ZpbmRfZW50
cnk6Cj4gPj4+ICAgICAgICBpZiAoZjJmc19oYXNfaW5saW5lX2RlbnRyeShkaXIpKSB7Cj4gPj4+
IC0gICAgICAgICAgICAgZGUgPSBmMmZzX2ZpbmRfaW5faW5saW5lX2RpcihkaXIsIGZuYW1lLCBy
ZXNfcGFnZSk7Cj4gPj4+ICsgICAgICAgICAgICAgZGUgPSBmMmZzX2ZpbmRfaW5faW5saW5lX2Rp
cihkaXIsIGZuYW1lLCByZXNfcGFnZSwgdXNlX2hhc2gpOwo+ID4+PiAgICAgICAgICAgICAgICBn
b3RvIG91dDsKPiA+Pj4gICAgICAgIH0KPiA+Pj4KPiA+Pj4gQEAgLTM0MywxMSArMzU0LDE4IEBA
IHN0cnVjdCBmMmZzX2Rpcl9lbnRyeSAqX19mMmZzX2ZpbmRfZW50cnkoc3RydWN0IGlub2RlICpk
aXIsCj4gPj4+ICAgICAgICB9Cj4gPj4+Cj4gPj4+ICAgICAgICBmb3IgKGxldmVsID0gMDsgbGV2
ZWwgPCBtYXhfZGVwdGg7IGxldmVsKyspIHsKPiA+Pj4gLSAgICAgICAgICAgICBkZSA9IGZpbmRf
aW5fbGV2ZWwoZGlyLCBsZXZlbCwgZm5hbWUsIHJlc19wYWdlKTsKPiA+Pj4gKyAgICAgICAgICAg
ICBkZSA9IGZpbmRfaW5fbGV2ZWwoZGlyLCBsZXZlbCwgZm5hbWUsIHJlc19wYWdlLCB1c2VfaGFz
aCk7Cj4gPj4+ICAgICAgICAgICAgICAgIGlmIChkZSB8fCBJU19FUlIoKnJlc19wYWdlKSkKPiA+
Pj4gICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+Pj4gICAgICAgIH0KPiA+Pj4gKwo+
ID4+PiAgICBvdXQ6Cj4gPj4+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfVU5JQ09ERSkKPiA+Pj4g
KyAgICAgaWYgKElTX0NBU0VGT0xERUQoZGlyKSAmJiAhZGUgJiYgdXNlX2hhc2gpIHsKPiA+Pj4g
KyAgICAgICAgICAgICB1c2VfaGFzaCA9IGZhbHNlOwo+ID4+PiArICAgICAgICAgICAgIGdvdG8g
c3RhcnRfZmluZF9lbnRyeTsKPiA+Pj4gKyAgICAgfQo+ID4+PiArI2VuZGlmCj4gPj4+ICAgICAg
ICAvKiBUaGlzIGlzIHRvIGluY3JlYXNlIHRoZSBzcGVlZCBvZiBmMmZzX2NyZWF0ZSAqLwo+ID4+
PiAgICAgICAgaWYgKCFkZSkKPiA+Pj4gICAgICAgICAgICAgICAgRjJGU19JKGRpciktPnRhc2sg
PSBjdXJyZW50Owo+ID4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2Yy
ZnMuaAo+ID4+PiBpbmRleCBmNTIzZGQzMDJiZjYuLjFhZmViYjljNDA2MSAxMDA2NDQKPiA+Pj4g
LS0tIGEvZnMvZjJmcy9mMmZzLmgKPiA+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiA+Pj4gQEAg
LTM1ODgsNyArMzU4OCw4IEBAIGludCBmMmZzX3ByZXBhcmVfbG9va3VwKHN0cnVjdCBpbm9kZSAq
ZGlyLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnksCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lKTsKPiA+Pj4gICAgdm9pZCBmMmZzX2ZyZWVfZmls
ZW5hbWUoc3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lKTsKPiA+Pj4gICAgc3RydWN0IGYyZnNf
ZGlyX2VudHJ5ICpmMmZzX2ZpbmRfdGFyZ2V0X2RlbnRyeShjb25zdCBzdHJ1Y3QgZjJmc19kZW50
cnlfcHRyICpkLAo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGYyZnNf
ZmlsZW5hbWUgKmZuYW1lLCBpbnQgKm1heF9zbG90cyk7Cj4gPj4+ICsgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgZjJmc19maWxlbmFtZSAqZm5hbWUsIGludCAqbWF4X3Nsb3RzLAo+
ID4+PiArICAgICAgICAgICAgICAgICAgICAgYm9vbCB1c2VfaGFzaCk7Cj4gPj4+ICAgIGludCBm
MmZzX2ZpbGxfZGVudHJpZXMoc3RydWN0IGRpcl9jb250ZXh0ICpjdHgsIHN0cnVjdCBmMmZzX2Rl
bnRyeV9wdHIgKmQsCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHN0
YXJ0X3Bvcywgc3RydWN0IGZzY3J5cHRfc3RyICpmc3RyKTsKPiA+Pj4gICAgdm9pZCBmMmZzX2Rv
X21ha2VfZW1wdHlfZGlyKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBpbm9kZSAqcGFyZW50
LAo+ID4+PiBAQCAtNDIyNCw3ICs0MjI1LDggQEAgaW50IGYyZnNfd3JpdGVfaW5saW5lX2RhdGEo
c3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZvbGlvICpmb2xpbyk7Cj4gPj4+ICAgIGludCBm
MmZzX3JlY292ZXJfaW5saW5lX2RhdGEoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IHBhZ2Ug
Km5wYWdlKTsKPiA+Pj4gICAgc3RydWN0IGYyZnNfZGlyX2VudHJ5ICpmMmZzX2ZpbmRfaW5faW5s
aW5lX2RpcihzdHJ1Y3QgaW5vZGUgKmRpciwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lLAo+ID4+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwYWdlICoqcmVzX3Bh
Z2UpOwo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBw
YWdlICoqcmVzX3BhZ2UsCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYm9vbCB1c2VfaGFzaCk7Cj4gPj4+ICAgIGludCBmMmZzX21ha2VfZW1wdHlfaW5saW5lX2Rp
cihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgaW5vZGUgKnBhcmVudCwKPiA+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqaXBhZ2UpOwo+ID4+PiAgICBpbnQgZjJmc19h
ZGRfaW5saW5lX2VudHJ5KHN0cnVjdCBpbm9kZSAqZGlyLCBjb25zdCBzdHJ1Y3QgZjJmc19maWxl
bmFtZSAqZm5hbWUsCj4gPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2lubGluZS5jIGIvZnMvZjJm
cy9pbmxpbmUuYwo+ID4+PiBpbmRleCBjYmQyYTBkMzQ4MDQuLjNlM2MzNWQ0Yzk4YiAxMDA2NDQK
PiA+Pj4gLS0tIGEvZnMvZjJmcy9pbmxpbmUuYwo+ID4+PiArKysgYi9mcy9mMmZzL2lubGluZS5j
Cj4gPj4+IEBAIC0zNTIsNyArMzUyLDggQEAgaW50IGYyZnNfcmVjb3Zlcl9pbmxpbmVfZGF0YShz
dHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgcGFnZSAqbnBhZ2UpCj4gPj4+Cj4gPj4+ICAgIHN0
cnVjdCBmMmZzX2Rpcl9lbnRyeSAqZjJmc19maW5kX2luX2lubGluZV9kaXIoc3RydWN0IGlub2Rl
ICpkaXIsCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IHN0cnVjdCBmMmZzX2ZpbGVuYW1lICpmbmFtZSwKPiA+Pj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqKnJlc19wYWdlKQo+ID4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwYWdlICoqcmVzX3BhZ2UsCj4gPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCB1c2VfaGFzaCkKPiA+
Pj4gICAgewo+ID4+PiAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19TQihk
aXItPmlfc2IpOwo+ID4+PiAgICAgICAgc3RydWN0IGYyZnNfZGlyX2VudHJ5ICpkZTsKPiA+Pj4g
QEAgLTM2OSw3ICszNzAsNyBAQCBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmYyZnNfZmluZF9pbl9p
bmxpbmVfZGlyKHN0cnVjdCBpbm9kZSAqZGlyLAo+ID4+PiAgICAgICAgaW5saW5lX2RlbnRyeSA9
IGlubGluZV9kYXRhX2FkZHIoZGlyLCBpcGFnZSk7Cj4gPj4+Cj4gPj4+ICAgICAgICBtYWtlX2Rl
bnRyeV9wdHJfaW5saW5lKGRpciwgJmQsIGlubGluZV9kZW50cnkpOwo+ID4+PiAtICAgICBkZSA9
IGYyZnNfZmluZF90YXJnZXRfZGVudHJ5KCZkLCBmbmFtZSwgTlVMTCk7Cj4gPj4+ICsgICAgIGRl
ID0gZjJmc19maW5kX3RhcmdldF9kZW50cnkoJmQsIGZuYW1lLCBOVUxMLCB1c2VfaGFzaCk7Cj4g
Pj4+ICAgICAgICB1bmxvY2tfcGFnZShpcGFnZSk7Cj4gPj4+ICAgICAgICBpZiAoSVNfRVJSKGRl
KSkgewo+ID4+PiAgICAgICAgICAgICAgICAqcmVzX3BhZ2UgPSBFUlJfQ0FTVChkZSk7Cj4gPj4K
PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
