Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 009C49F8BDD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Dec 2024 06:26:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tOVWp-0008P9-5G;
	Fri, 20 Dec 2024 05:26:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chullee@google.com>) id 1tOVWn-0008P3-A9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 05:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8x1Np4k5LvT8PDmRjqklJalWGfGZWJ6g7e252odoJz8=; b=kYC+Dtyz+xz2lZwDYdRiUVKKML
 nuAfb5ylgACDqe8CtEDjtlF9hnluFcWz+INYEFAqVOuQIyfw8Kxk03cu6d8UVLK78Iq9J/lLdUjar
 wZba/kEx1ba0Ha2BYuejnod6EkwkmzUO/FpTjZ4HS6tG/b4zyKBlsMaQQcGjlbbOV/ro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8x1Np4k5LvT8PDmRjqklJalWGfGZWJ6g7e252odoJz8=; b=fWYE27I9Lo6vwI95Nv+qISOLIt
 IFfZHa2S2k9NikBvQyccKwUc6cMFc63C/4/vzbHtduJ2+gsiR5DW1f6xsIuTWxy5+ozyMGHbVMKot
 fppKLafyangZzrl1QuyYjwOp5QdMIGvI0W0zLhfUZoASmylmmALhRshW7Z2WNsY5CdLM=;
Received: from mail-qt1-f179.google.com ([209.85.160.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tOVWm-0004vA-8h for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 05:26:21 +0000
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-467896541e1so171001cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Dec 2024 21:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1734672369; x=1735277169;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8x1Np4k5LvT8PDmRjqklJalWGfGZWJ6g7e252odoJz8=;
 b=yYoXilWGGFJ0ASXss+AQyrHXruQbm3DCwwVdbRwgbcJ2cv+teZwbj8FdUXp+hzr+8u
 5gFrHZpYmAYE4ryrc2pSftaoVaB1DHcKQO3H4YuoZFAmJf7j/j6T+rNQSNXTaaV/QE93
 wrNVfjJiVJovNaEUoijKoGKSolBDDSGrotNpKaGibO5ZnD50Z0kRcU4OJD2WH9wvNcAf
 tKlfdPMd7nzQUq1OaVKbWNkGH+VtkAlYZlBlEx5Yd57k6kdqXCna649MBSZMn9iPvNqu
 F+lZRR2VVGVoL2Rp6GhUn0hGggJ/UalKlpY10goVR9YeOcZvPrdylc4ZVgUy59uio7x8
 T/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734672369; x=1735277169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8x1Np4k5LvT8PDmRjqklJalWGfGZWJ6g7e252odoJz8=;
 b=naUyBJeP3XfhltyRtLPsP3EkPAJTTbkgVc1uXijvUcrhz07cbSrc9v8bZO5uiZ4KCb
 suuou7K/I4mHLGThciqeB5QK1IVFQjCN/42bFPQbMgJhPfOVGaZ+zzPtkMwr/Ef/i+xG
 mFXshNBnbi0uKQKOh/D7IkumxQBzKx3lCUXNiiDTp+JVxbjYEjJ5AVBSY8GmfGM6T9r7
 AMdcVNLbUpujSZjIRA4ieykoiuTLsNVMpKzDoq6ug6drzrb3a2XS6J10MhsYBNeHivjc
 SOBCSp8wiOdehQTxL4c4lQI+XFmFj0PgpsbU6KP13Pt7XybvpV0Pl99m1orRtIZ7RuaR
 1tBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgQi035enla3FAe7rmCcJkUaygLXmDaBIUL/uMOXC8BPeUfZqfQNqYLN7Q1wyKXeaoB/gIxMJAwMKgVa74VKiP@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxMiALOFx7xKq08/twUic0VLfQD7zqIKMuRRSxWSKHCfas3ozNO
 UyRWIHde+WHna7C/3n116YRRGkCi90DLR7PI7jek61cQqRQW8gQaOfzWDwJNKf9StEuzehy91Np
 F9hVrWvaoie28cZFUyvdukzWHXwTqWpwK08zLU3fjlkk07ZvE1951
X-Gm-Gg: ASbGnctUCmRlIh5rFlOwgTi8hKVKwpHOk267/5/nl25/EhgVc3hKCobCQB06lx0yDhk
 PUtwZKzppkSAC8z4oSRN/K56HLrb+A6IlyCF64A==
X-Google-Smtp-Source: AGHT+IEfysowbZTWxWm5rXAlg+OGDsj0x5WrQWq+rWsWG/aoeGK3GkQ6+VG7vG/DVnki+x0lZoWXhGRBm0cPIaqClbk=
X-Received: by 2002:a05:622a:95:b0:467:84a1:df08 with SMTP id
 d75a77b69052e-46a4c01bb1cmr1098871cf.23.1734670775485; Thu, 19 Dec 2024
 20:59:35 -0800 (PST)
MIME-Version: 1.0
References: <20241217075552.1167994-1-chullee@google.com>
 <31e9c60b-0fd1-4d98-baf9-cf02e44c367d@kernel.org>
In-Reply-To: <31e9c60b-0fd1-4d98-baf9-cf02e44c367d@kernel.org>
Date: Thu, 19 Dec 2024 20:59:24 -0800
Message-ID: <CALBjLoBxtMQjKQXdzyt8x75--mT9nJZnoEpDArL56fg8JRPdTg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Dec 19, 2024 at 5:29 AM Chao Yu <chao@kernel.org>
    wrote: > > Hi Daniel, > > On 2024/12/17 15:55, Daniel Lee wrote: > > This
    patch addresses an issue where some files in case-insensitive > > [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.160.179 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.160.179 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.179 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1tOVWm-0004vA-8h
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

T24gVGh1LCBEZWMgMTksIDIwMjQgYXQgNToyOeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBIaSBEYW5pZWwsCj4KPiBPbiAyMDI0LzEyLzE3IDE1OjU1LCBEYW5pZWwg
TGVlIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBhZGRyZXNzZXMgYW4gaXNzdWUgd2hlcmUgc29tZSBm
aWxlcyBpbiBjYXNlLWluc2Vuc2l0aXZlCj4gPiBkaXJlY3RvcmllcyBiZWNvbWUgaW5hY2Nlc3Np
YmxlIGR1ZSB0byBjaGFuZ2VzIGluIGhvdyB0aGUga2VybmVsIGZ1bmN0aW9uLAo+ID4gdXRmOF9j
YXNlZm9sZCgpLCBnZW5lcmF0ZXMgY2FzZS1mb2xkZWQgc3RyaW5ncyBmcm9tIHRoZSBjb21taXQg
NWMyNmQyZjFkM2Y1Cj4gPiAoInVuaWNvZGU6IERvbid0IHNwZWNpYWwgY2FzZSBpZ25vcmFibGUg
Y29kZSBwb2ludHMiKS4KPiA+Cj4gPiBGMkZTIHVzZXMgdGhlc2UgY2FzZS1mb2xkZWQgbmFtZXMg
dG8gY2FsY3VsYXRlIGhhc2ggdmFsdWVzIGZvciBsb2NhdGluZwo+ID4gZGVudHJpZXMgYW5kIHN0
b3JlcyB0aGVtIG9uIGRpc2suIFNpbmNlIHV0ZjhfY2FzZWZvbGQoKSBjYW4gcHJvZHVjZQo+ID4g
ZGlmZmVyZW50IG91dHB1dCBhY3Jvc3Mga2VybmVsIHZlcnNpb25zLCBzdG9yZWQgaGFzaCB2YWx1
ZXMgYW5kIG5ld2x5Cj4gPiBjYWxjdWxhdGVkIGhhc2ggdmFsdWVzIG1heSBkaWZmZXIuIFRoaXMg
cmVzdWx0cyBpbiBhZmZlY3RlZCBmaWxlcyBubwo+ID4gbG9uZ2VyIGJlaW5nIGZvdW5kIHZpYSB0
aGUgaGFzaC1iYXNlZCBsb29rdXAuCj4gPgo+ID4gVG8gcmVzb2x2ZSB0aGlzLCB0aGUgcGF0Y2gg
aW50cm9kdWNlcyBhIGxpbmVhciBzZWFyY2ggZmFsbGJhY2suCj4gPiBJZiB0aGUgaW5pdGlhbCBo
YXNoLWJhc2VkIHNlYXJjaCBmYWlscywgRjJGUyB3aWxsIHNlcXVlbnRpYWxseSBzY2FuIHRoZQo+
ID4gZGlyZWN0b3J5IGVudHJpZXMuCj4gPgo+Cj4gTmVlZCBhIGZpeGVzIGxpbmU/CgpUaGFua3Mu
IEkgd2lsbCBhZGQgdGhlIGNvbW1pdCA1YzI2ZDJmMWQzZjUgdG8gdGhlIEZpeGVzOgoKPgo+ID4g
TGluazogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTk1ODYK
PiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMZWUgPGNodWxsZWVAZ29vZ2xlLmNvbT4KPiA+IC0t
LQo+ID4gICBmcy9mMmZzL2Rpci5jICAgIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0KPiA+ICAgZnMvZjJmcy9mMmZzLmggICB8ICA2ICsrKystLQo+ID4gICBmcy9m
MmZzL2lubGluZS5jIHwgIDUgKysrLS0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kaXIu
YyBiL2ZzL2YyZnMvZGlyLmMKPiA+IGluZGV4IDQ3YTVjODA2Y2YxNi4uYTg1ZDE5YjRlMTc4IDEw
MDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9kaXIuYwo+ID4gKysrIGIvZnMvZjJmcy9kaXIuYwo+ID4g
QEAgLTE3NSw3ICsxNzUsOCBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBkaXJfYmxvY2tfaW5kZXgo
dW5zaWduZWQgaW50IGxldmVsLAo+ID4gICBzdGF0aWMgc3RydWN0IGYyZnNfZGlyX2VudHJ5ICpm
aW5kX2luX2Jsb2NrKHN0cnVjdCBpbm9kZSAqZGlyLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IHBhZ2UgKmRlbnRyeV9wYWdlLAo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lLAo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW50ICptYXhfc2xvdHMpCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpbnQgKm1heF9zbG90cywKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJvb2wgdXNlX2hhc2gpCj4gPiAgIHsKPiA+ICAgICAgIHN0cnVjdCBmMmZzX2Rl
bnRyeV9ibG9jayAqZGVudHJ5X2JsazsKPiA+ICAgICAgIHN0cnVjdCBmMmZzX2RlbnRyeV9wdHIg
ZDsKPiA+IEBAIC0xODMsNyArMTg0LDcgQEAgc3RhdGljIHN0cnVjdCBmMmZzX2Rpcl9lbnRyeSAq
ZmluZF9pbl9ibG9jayhzdHJ1Y3QgaW5vZGUgKmRpciwKPiA+ICAgICAgIGRlbnRyeV9ibGsgPSAo
c3RydWN0IGYyZnNfZGVudHJ5X2Jsb2NrICopcGFnZV9hZGRyZXNzKGRlbnRyeV9wYWdlKTsKPiA+
Cj4gPiAgICAgICBtYWtlX2RlbnRyeV9wdHJfYmxvY2soZGlyLCAmZCwgZGVudHJ5X2Jsayk7Cj4g
PiAtICAgICByZXR1cm4gZjJmc19maW5kX3RhcmdldF9kZW50cnkoJmQsIGZuYW1lLCBtYXhfc2xv
dHMpOwo+ID4gKyAgICAgcmV0dXJuIGYyZnNfZmluZF90YXJnZXRfZGVudHJ5KCZkLCBmbmFtZSwg
bWF4X3Nsb3RzLCB1c2VfaGFzaCk7Cj4gPiAgIH0KPiA+Cj4gPiAgIHN0YXRpYyBpbmxpbmUgaW50
IGYyZnNfbWF0Y2hfbmFtZShjb25zdCBzdHJ1Y3QgaW5vZGUgKmRpciwKPiA+IEBAIC0yMDgsNyAr
MjA5LDggQEAgc3RhdGljIGlubGluZSBpbnQgZjJmc19tYXRjaF9uYW1lKGNvbnN0IHN0cnVjdCBp
bm9kZSAqZGlyLAo+ID4gICB9Cj4gPgo+ID4gICBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmYyZnNf
ZmluZF90YXJnZXRfZGVudHJ5KGNvbnN0IHN0cnVjdCBmMmZzX2RlbnRyeV9wdHIgKmQsCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lLCBp
bnQgKm1heF9zbG90cykKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZjJm
c19maWxlbmFtZSAqZm5hbWUsIGludCAqbWF4X3Nsb3RzLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGJvb2wgdXNlX2hhc2gpCj4gPiAgIHsKPiA+ICAgICAgIHN0cnVjdCBmMmZzX2Rpcl9lbnRy
eSAqZGU7Cj4gPiAgICAgICB1bnNpZ25lZCBsb25nIGJpdF9wb3MgPSAwOwo+ID4gQEAgLTIzMSw3
ICsyMzMsNyBAQCBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmYyZnNfZmluZF90YXJnZXRfZGVudHJ5
KGNvbnN0IHN0cnVjdCBmMmZzX2RlbnRyeV9wdHIgKmQsCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7Cj4gPiAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAtICAgICAgICAgICAgIGlm
IChkZS0+aGFzaF9jb2RlID09IGZuYW1lLT5oYXNoKSB7Cj4gPiArICAgICAgICAgICAgIGlmICgh
dXNlX2hhc2ggfHwgZGUtPmhhc2hfY29kZSA9PSBmbmFtZS0+aGFzaCkgewo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIHJlcyA9IGYyZnNfbWF0Y2hfbmFtZShkLT5pbm9kZSwgZm5hbWUsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGQtPmZpbGVuYW1lW2Jp
dF9wb3NdLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBs
ZTE2X3RvX2NwdShkZS0+bmFtZV9sZW4pKTsKPiA+IEBAIC0yNTgsMTEgKzI2MCwxMiBAQCBzdHJ1
Y3QgZjJmc19kaXJfZW50cnkgKmYyZnNfZmluZF90YXJnZXRfZGVudHJ5KGNvbnN0IHN0cnVjdCBm
MmZzX2RlbnRyeV9wdHIgKmQsCj4gPiAgIHN0YXRpYyBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmZp
bmRfaW5fbGV2ZWwoc3RydWN0IGlub2RlICpkaXIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBsZXZlbCwKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lLAo+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqKnJl
c19wYWdlKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
cGFnZSAqKnJlc19wYWdlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBib29sIHVzZV9oYXNoKQo+ID4gICB7Cj4gPiAgICAgICBpbnQgcyA9IEdFVF9ERU5UUllfU0xP
VFMoZm5hbWUtPmRpc2tfbmFtZS5sZW4pOwo+ID4gICAgICAgdW5zaWduZWQgaW50IG5idWNrZXQs
IG5ibG9jazsKPiA+IC0gICAgIHVuc2lnbmVkIGludCBiaWR4LCBlbmRfYmxvY2s7Cj4gPiArICAg
ICB1bnNpZ25lZCBpbnQgYmlkeCwgZW5kX2Jsb2NrLCBidWNrZXRfbm87Cj4gPiAgICAgICBzdHJ1
Y3QgcGFnZSAqZGVudHJ5X3BhZ2U7Cj4gPiAgICAgICBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmRl
ID0gTlVMTDsKPiA+ICAgICAgIHBnb2ZmX3QgbmV4dF9wZ29mczsKPiA+IEBAIC0yNzIsOCArMjc1
LDExIEBAIHN0YXRpYyBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmZpbmRfaW5fbGV2ZWwoc3RydWN0
IGlub2RlICpkaXIsCj4gPiAgICAgICBuYnVja2V0ID0gZGlyX2J1Y2tldHMobGV2ZWwsIEYyRlNf
SShkaXIpLT5pX2Rpcl9sZXZlbCk7Cj4gPiAgICAgICBuYmxvY2sgPSBidWNrZXRfYmxvY2tzKGxl
dmVsKTsKPiA+Cj4gPiArICAgICBidWNrZXRfbm8gPSB1c2VfaGFzaCA/IGxlMzJfdG9fY3B1KGZu
YW1lLT5oYXNoKSAlIG5idWNrZXQgOiAwOwo+ID4gKwo+ID4gK3N0YXJ0X2ZpbmRfYnVja2V0Ogo+
ID4gICAgICAgYmlkeCA9IGRpcl9ibG9ja19pbmRleChsZXZlbCwgRjJGU19JKGRpciktPmlfZGly
X2xldmVsLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZTMyX3RvX2NwdShmbmFt
ZS0+aGFzaCkgJSBuYnVja2V0KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnVj
a2V0X25vKTsKPiA+ICAgICAgIGVuZF9ibG9jayA9IGJpZHggKyBuYmxvY2s7Cj4gPgo+ID4gICAg
ICAgd2hpbGUgKGJpZHggPCBlbmRfYmxvY2spIHsKPiA+IEBAIC0yOTAsNyArMjk2LDcgQEAgc3Rh
dGljIHN0cnVjdCBmMmZzX2Rpcl9lbnRyeSAqZmluZF9pbl9sZXZlbChzdHJ1Y3QgaW5vZGUgKmRp
ciwKPiA+ICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgICAgICAgIH0KPiA+Cj4g
PiAtICAgICAgICAgICAgIGRlID0gZmluZF9pbl9ibG9jayhkaXIsIGRlbnRyeV9wYWdlLCBmbmFt
ZSwgJm1heF9zbG90cyk7Cj4gPiArICAgICAgICAgICAgIGRlID0gZmluZF9pbl9ibG9jayhkaXIs
IGRlbnRyeV9wYWdlLCBmbmFtZSwgJm1heF9zbG90cywgdXNlX2hhc2gpOwo+ID4gICAgICAgICAg
ICAgICBpZiAoSVNfRVJSKGRlKSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICpyZXNfcGFn
ZSA9IEVSUl9DQVNUKGRlKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBkZSA9IE5VTEw7Cj4g
PiBAQCAtMzA3LDYgKzMxMyw5IEBAIHN0YXRpYyBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmZpbmRf
aW5fbGV2ZWwoc3RydWN0IGlub2RlICpkaXIsCj4gPiAgICAgICAgICAgICAgIGJpZHgrKzsKPiA+
ICAgICAgIH0KPiA+Cj4gPiArICAgICBpZiAoIXVzZV9oYXNoICYmICFkZSAmJiArK2J1Y2tldF9u
byA8IG5idWNrZXQpCj4gPiArICAgICAgICAgICAgIGdvdG8gc3RhcnRfZmluZF9idWNrZXQ7Cj4g
PiArCj4gPiAgICAgICBpZiAoIWRlICYmIHJvb20gJiYgRjJGU19JKGRpciktPmNoYXNoICE9IGZu
YW1lLT5oYXNoKSB7Cj4KPiBEbyB3ZSBuZWVkIHRvIGF2b2lkIGFjY2Vzc2luZyBvciBhc3NpZ25p
bmcgaGFzaCBpZiB1c2VfaGFzaCBpcyBmYWxzZT8KPgoKSXMgaXQgc3RpbGwgd29ydGgga2VlcGlu
ZyB0aGUgaGFzaCBmb3IgdGhlIGNyZWF0aW9uIGlmIGJvdGggaGFzaC1iYXNlZAphbmQgbGluZWFy
IHNlYXJjaGVzIGZhaWxlZD8KCj4gVGhhbmtzLAo+Cj4gPiAgICAgICAgICAgICAgIEYyRlNfSShk
aXIpLT5jaGFzaCA9IGZuYW1lLT5oYXNoOwo+ID4gICAgICAgICAgICAgICBGMkZTX0koZGlyKS0+
Y2xldmVsID0gbGV2ZWw7Cj4gPiBAQCAtMzIzLDExICszMzIsMTMgQEAgc3RydWN0IGYyZnNfZGly
X2VudHJ5ICpfX2YyZnNfZmluZF9lbnRyeShzdHJ1Y3QgaW5vZGUgKmRpciwKPiA+ICAgICAgIHN0
cnVjdCBmMmZzX2Rpcl9lbnRyeSAqZGUgPSBOVUxMOwo+ID4gICAgICAgdW5zaWduZWQgaW50IG1h
eF9kZXB0aDsKPiA+ICAgICAgIHVuc2lnbmVkIGludCBsZXZlbDsKPiA+ICsgICAgIGJvb2wgdXNl
X2hhc2ggPSB0cnVlOwo+ID4KPiA+ICAgICAgICpyZXNfcGFnZSA9IE5VTEw7Cj4gPgo+ID4gK3N0
YXJ0X2ZpbmRfZW50cnk6Cj4gPiAgICAgICBpZiAoZjJmc19oYXNfaW5saW5lX2RlbnRyeShkaXIp
KSB7Cj4gPiAtICAgICAgICAgICAgIGRlID0gZjJmc19maW5kX2luX2lubGluZV9kaXIoZGlyLCBm
bmFtZSwgcmVzX3BhZ2UpOwo+ID4gKyAgICAgICAgICAgICBkZSA9IGYyZnNfZmluZF9pbl9pbmxp
bmVfZGlyKGRpciwgZm5hbWUsIHJlc19wYWdlLCB1c2VfaGFzaCk7Cj4gPiAgICAgICAgICAgICAg
IGdvdG8gb3V0Owo+ID4gICAgICAgfQo+ID4KPiA+IEBAIC0zNDMsMTEgKzM1NCwxOCBAQCBzdHJ1
Y3QgZjJmc19kaXJfZW50cnkgKl9fZjJmc19maW5kX2VudHJ5KHN0cnVjdCBpbm9kZSAqZGlyLAo+
ID4gICAgICAgfQo+ID4KPiA+ICAgICAgIGZvciAobGV2ZWwgPSAwOyBsZXZlbCA8IG1heF9kZXB0
aDsgbGV2ZWwrKykgewo+ID4gLSAgICAgICAgICAgICBkZSA9IGZpbmRfaW5fbGV2ZWwoZGlyLCBs
ZXZlbCwgZm5hbWUsIHJlc19wYWdlKTsKPiA+ICsgICAgICAgICAgICAgZGUgPSBmaW5kX2luX2xl
dmVsKGRpciwgbGV2ZWwsIGZuYW1lLCByZXNfcGFnZSwgdXNlX2hhc2gpOwo+ID4gICAgICAgICAg
ICAgICBpZiAoZGUgfHwgSVNfRVJSKCpyZXNfcGFnZSkpCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gPiAgICAgICB9Cj4gPiArCj4gPiAgIG91dDoKPiA+ICsjaWYgSVNfRU5BQkxF
RChDT05GSUdfVU5JQ09ERSkKPiA+ICsgICAgIGlmIChJU19DQVNFRk9MREVEKGRpcikgJiYgIWRl
ICYmIHVzZV9oYXNoKSB7Cj4gPiArICAgICAgICAgICAgIHVzZV9oYXNoID0gZmFsc2U7Cj4gPiAr
ICAgICAgICAgICAgIGdvdG8gc3RhcnRfZmluZF9lbnRyeTsKPiA+ICsgICAgIH0KPiA+ICsjZW5k
aWYKPiA+ICAgICAgIC8qIFRoaXMgaXMgdG8gaW5jcmVhc2UgdGhlIHNwZWVkIG9mIGYyZnNfY3Jl
YXRlICovCj4gPiAgICAgICBpZiAoIWRlKQo+ID4gICAgICAgICAgICAgICBGMkZTX0koZGlyKS0+
dGFzayA9IGN1cnJlbnQ7Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZz
L2YyZnMuaAo+ID4gaW5kZXggZjUyM2RkMzAyYmY2Li4xYWZlYmI5YzQwNjEgMTAwNjQ0Cj4gPiAt
LS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiA+IEBAIC0zNTg4
LDcgKzM1ODgsOCBAQCBpbnQgZjJmc19wcmVwYXJlX2xvb2t1cChzdHJ1Y3QgaW5vZGUgKmRpciwg
c3RydWN0IGRlbnRyeSAqZGVudHJ5LAo+ID4gICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBm
MmZzX2ZpbGVuYW1lICpmbmFtZSk7Cj4gPiAgIHZvaWQgZjJmc19mcmVlX2ZpbGVuYW1lKHN0cnVj
dCBmMmZzX2ZpbGVuYW1lICpmbmFtZSk7Cj4gPiAgIHN0cnVjdCBmMmZzX2Rpcl9lbnRyeSAqZjJm
c19maW5kX3RhcmdldF9kZW50cnkoY29uc3Qgc3RydWN0IGYyZnNfZGVudHJ5X3B0ciAqZCwKPiA+
IC0gICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZjJmc19maWxlbmFtZSAqZm5hbWUs
IGludCAqbWF4X3Nsb3RzKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
ZjJmc19maWxlbmFtZSAqZm5hbWUsIGludCAqbWF4X3Nsb3RzLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGJvb2wgdXNlX2hhc2gpOwo+ID4gICBpbnQgZjJmc19maWxsX2RlbnRyaWVzKHN0cnVj
dCBkaXJfY29udGV4dCAqY3R4LCBzdHJ1Y3QgZjJmc19kZW50cnlfcHRyICpkLAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzdGFydF9wb3MsIHN0cnVjdCBmc2NyeXB0X3N0
ciAqZnN0cik7Cj4gPiAgIHZvaWQgZjJmc19kb19tYWtlX2VtcHR5X2RpcihzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCBzdHJ1Y3QgaW5vZGUgKnBhcmVudCwKPiA+IEBAIC00MjI0LDcgKzQyMjUsOCBAQCBp
bnQgZjJmc193cml0ZV9pbmxpbmVfZGF0YShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZm9s
aW8gKmZvbGlvKTsKPiA+ICAgaW50IGYyZnNfcmVjb3Zlcl9pbmxpbmVfZGF0YShzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCBzdHJ1Y3QgcGFnZSAqbnBhZ2UpOwo+ID4gICBzdHJ1Y3QgZjJmc19kaXJfZW50
cnkgKmYyZnNfZmluZF9pbl9pbmxpbmVfZGlyKHN0cnVjdCBpbm9kZSAqZGlyLAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZjJmc19maWxlbmFt
ZSAqZm5hbWUsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBwYWdlICoqcmVzX3BhZ2UpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgcGFnZSAqKnJlc19wYWdlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBib29sIHVzZV9oYXNoKTsKPiA+ICAgaW50IGYyZnNfbWFrZV9lbXB0eV9p
bmxpbmVfZGlyKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBpbm9kZSAqcGFyZW50LAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwYWdlICppcGFnZSk7Cj4gPiAgIGludCBmMmZz
X2FkZF9pbmxpbmVfZW50cnkoc3RydWN0IGlub2RlICpkaXIsIGNvbnN0IHN0cnVjdCBmMmZzX2Zp
bGVuYW1lICpmbmFtZSwKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2lubGluZS5jIGIvZnMvZjJm
cy9pbmxpbmUuYwo+ID4gaW5kZXggY2JkMmEwZDM0ODA0Li4zZTNjMzVkNGM5OGIgMTAwNjQ0Cj4g
PiAtLS0gYS9mcy9mMmZzL2lubGluZS5jCj4gPiArKysgYi9mcy9mMmZzL2lubGluZS5jCj4gPiBA
QCAtMzUyLDcgKzM1Miw4IEBAIGludCBmMmZzX3JlY292ZXJfaW5saW5lX2RhdGEoc3RydWN0IGlu
b2RlICppbm9kZSwgc3RydWN0IHBhZ2UgKm5wYWdlKQo+ID4KPiA+ICAgc3RydWN0IGYyZnNfZGly
X2VudHJ5ICpmMmZzX2ZpbmRfaW5faW5saW5lX2RpcihzdHJ1Y3QgaW5vZGUgKmRpciwKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGYyZnNfZmls
ZW5hbWUgKmZuYW1lLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgcGFnZSAqKnJlc19wYWdlKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgcGFnZSAqKnJlc19wYWdlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBib29sIHVzZV9oYXNoKQo+ID4gICB7Cj4gPiAgICAgICBzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX1NCKGRpci0+aV9zYik7Cj4gPiAgICAgICBzdHJ1Y3Qg
ZjJmc19kaXJfZW50cnkgKmRlOwo+ID4gQEAgLTM2OSw3ICszNzAsNyBAQCBzdHJ1Y3QgZjJmc19k
aXJfZW50cnkgKmYyZnNfZmluZF9pbl9pbmxpbmVfZGlyKHN0cnVjdCBpbm9kZSAqZGlyLAo+ID4g
ICAgICAgaW5saW5lX2RlbnRyeSA9IGlubGluZV9kYXRhX2FkZHIoZGlyLCBpcGFnZSk7Cj4gPgo+
ID4gICAgICAgbWFrZV9kZW50cnlfcHRyX2lubGluZShkaXIsICZkLCBpbmxpbmVfZGVudHJ5KTsK
PiA+IC0gICAgIGRlID0gZjJmc19maW5kX3RhcmdldF9kZW50cnkoJmQsIGZuYW1lLCBOVUxMKTsK
PiA+ICsgICAgIGRlID0gZjJmc19maW5kX3RhcmdldF9kZW50cnkoJmQsIGZuYW1lLCBOVUxMLCB1
c2VfaGFzaCk7Cj4gPiAgICAgICB1bmxvY2tfcGFnZShpcGFnZSk7Cj4gPiAgICAgICBpZiAoSVNf
RVJSKGRlKSkgewo+ID4gICAgICAgICAgICAgICAqcmVzX3BhZ2UgPSBFUlJfQ0FTVChkZSk7Cj4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
