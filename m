Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC7B84C0FB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Feb 2024 00:39:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXV24-0004T3-VH;
	Tue, 06 Feb 2024 23:39:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rXV21-0004Se-8f
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Feb 2024 23:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Ay/wmQBGa/QgXcT4SCYzDcg/BJP+Mh/Ml8UB7GvwyI=; b=djJ61Ct6KTrxa5mZma+0C+9XZ5
 rdcqoY/03aWrTf7jknhfqd/1Q1ccPURVK5E46gSfZzcqBcR1AnNXuOAZhLIYvi8a0A7J4BTylFRcI
 txJoBvdkC9oyMUhTJtz/jNAkrfUYgYXE+Fr25fUktP4a7eOG6QiTDbZfYiX171RpokVM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Ay/wmQBGa/QgXcT4SCYzDcg/BJP+Mh/Ml8UB7GvwyI=; b=HjNAkfgMRrUcadiL7AskAsvOro
 ptNWjdS3dxgwIMz+Z6lYQJdiB1kulaOO0zKzVJ9F2K5oMW63BUP5gHVFVegXqDGye/lKPPvMQLYqp
 Bhp38faNloswjhD0BF+7LGc2ZMMTU0wJItjM3y77v8XvJe8ssdwobEHoAQaxqJ0lCfbM=;
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rXV1z-0007KD-Qf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Feb 2024 23:39:13 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so497771fa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Feb 2024 15:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707262741; x=1707867541; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Ay/wmQBGa/QgXcT4SCYzDcg/BJP+Mh/Ml8UB7GvwyI=;
 b=nhOCrtt0W8SzAbmkEj/ANoCuON8Bw7iBQgvUS62c0mLVi1w+/KsqbldeZWKpYLy3rX
 ewmCaNVTAqBVZU3PSzetK40m1wtk1GUORFhZSzSJJfGUwV9+NMWllVo2rZzO12VepLnq
 6NvPE3XiGZAcZ2ztn+O3RWfmRsNIZK92mFs6oNhfmsCTZx5mAZ7KbUiwkTmePrJq8BNb
 MXL+oxIjeEk/MgxT1GONKzE31qlVr4qZQoc/gQXvHRsyBFbl+CswVf5P2F5Usdg5w+cL
 DqsIT4nS2lrCexm88BpYB9OE1w7k6GGKbZFAmB9yJiXEAfSZ3w98rG3OPV/PAHRds0K9
 c9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707262741; x=1707867541;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Ay/wmQBGa/QgXcT4SCYzDcg/BJP+Mh/Ml8UB7GvwyI=;
 b=gWVRJHvFsA7JzbgKnKurWmchyzM/ada5rq+d3+xhlHMAbMMz9/ii4RbzXh8uaXYV/l
 lK7gLN5A57qzmmATRhGjvaMtqelq//2AWAgS2c4m8lyMkVf+1tuULZFyh1f9E6kcpKYi
 2XKjCq1WqU4ESwH28fZfOuM+3qpSR6daBhbaIDE4cE7b5H4GFDBRFqg/+eW2LU01bpD4
 QW8De9aw7t+p6LyTGMgfR9vflgfg1J4sk2zLV+xGyb4GxDlGmkZD0NyG1iHnsxcS9RQy
 NhILTSU7RjBQuSvXnDtM8n9LlUi4HuqjBXmFemhieW24C6ulA2PP4nGgdZNvAp8lWwRi
 7Yjg==
X-Gm-Message-State: AOJu0YxLSbK306NUqD+C916t7n9uSI/dclampUNtKFZ5nnIwOsLaWFkG
 lo+k0qRYsZwNhc1MLN4msMwmHnNgXqGiuipc1EtPo2GS9CL6jo6nG+115eNP81k+Kj8ClwZgCs0
 UcBa4TqqnUdPXarB4wOjiq2hROBs=
X-Google-Smtp-Source: AGHT+IG1kEaWggvufauvMaJ+pvC2z8XIcXPrVEsSDRS66zPxE16F5sRkQvpnOFPaJyPRsGfzogFiB8dnq0HnEzTDLVc=
X-Received: by 2002:a2e:9084:0:b0:2d0:a307:f167 with SMTP id
 l4-20020a2e9084000000b002d0a307f167mr2540524ljg.24.1707262740413; Tue, 06 Feb
 2024 15:39:00 -0800 (PST)
MIME-Version: 1.0
References: <1707103845-17220-1-git-send-email-zhiguo.niu@unisoc.com>
 <e2680238-9e9c-422a-adf3-bcee71dfe0a8@kernel.org>
 <ZcGoWAsl08d5-U0g@google.com>
 <2155b7d2-f7ee-4ce6-b4c9-48f715f6aa00@kernel.org>
In-Reply-To: <2155b7d2-f7ee-4ce6-b4c9-48f715f6aa00@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 7 Feb 2024 07:38:49 +0800
Message-ID: <CAHJ8P3K1jnT=vU1Gj=afA86Fe19rxA5DfdFdPk-yaa3WPM6iig@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Feb 6, 2024 at 11:36 AM Chao Yu wrote: > > On 2024/2/6
    11:32, Jaegeuk Kim wrote: > > On 02/05, Chao Yu wrote: > >> On 2024/2/5 11:30,
    Zhiguo Niu wrote: > >>> There are some cases of f2fs_i [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.169 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rXV1z-0007KD-Qf
Subject: Re: [f2fs-dev] [PATCH v7] f2fs: unify the error handling of
 f2fs_is_valid_blkaddr
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBGZWIgNiwgMjAyNCBhdCAxMTozNuKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzIvNiAxMTozMiwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gPiBP
biAwMi8wNSwgQ2hhbyBZdSB3cm90ZToKPiA+PiBPbiAyMDI0LzIvNSAxMTozMCwgWmhpZ3VvIE5p
dSB3cm90ZToKPiA+Pj4gVGhlcmUgYXJlIHNvbWUgY2FzZXMgb2YgZjJmc19pc192YWxpZF9ibGth
ZGRyIG5vdCBoYW5kbGVkIGFzCj4gPj4+IEVSUk9SX0lOVkFMSURfQkxLQUREUixzbyB1bmlmeSB0
aGUgZXJyb3IgaGFuZGxpbmcgYWJvdXQgYWxsIG9mCj4gPj4+IGYyZnNfaXNfdmFsaWRfYmxrYWRk
ci4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlz
b2MuY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4g
Pj4+IC0tLQo+ID4+PiBjaGFuZ2VzIG9mIHY3OiB1cGRhdGUgcGF0Y2ggYWNjb3JkaW5nIHRvIHN5
bmMgd2l0aCBDaGFvCj4gPj4+ICAgICAtcmVzdG9yZSBzb21lIGNvZGUgdG8gb3JpZ2luYWwKPiA+
Pj4gICAgIC1tb2RpZnkgZXJyIGhhbmRsZSBvZiBfX2lzX2JpdG1hcF92YWxpZCBmb3IgY292ZXJp
bmcgYWxsIGNhc2VzCj4gPj4+IGNoYW5nZXMgb2YgdjY6IGltcHJvdmUgcGF0Y2ggYWNjb3JkaW5n
IHRvIENoYW8ncyBzdWdnZXN0aW9ucwo+ID4+PiAgICAgLXJlc3RvcmUgZHVtcF9zdGFjayB0byBv
cmlnaW5hbCBwb3NpdGlvbgo+ID4+PiAgICAgLWFkanVlc3QgY29kZSBzZXF1ZW5jZSBvZiBfX2lz
X2JpdG1hcF9jaGVja192YWxpZAo+ID4+PiBjaGFuZ2VzIG9mIHY1OiBpbXByb3ZlIHBhdGNoIGFj
Y29yZGluZyB0byBKYWVnZXVrJ3Mgc3VnZ2VzdGlvbmdzCj4gPj4+ICAgICAtcmVzdG9yZSByZXR1
cm4gdmFsdWUgb2Ygc29tZSBmMmZzX2lzX3ZhbGlkX2Jsa2FkZHIgZXJyb3IgY2FzZSB0byBvcmln
aW5hbAo+ID4+PiAgICAgLW1vdmUgY3BfZXJyIGNoZWNraW5nIHRvIG91dGVybW9zdCBmb3IgdW5p
ZmllZCBwcm9jZXNzaW5nCj4gPj4+ICAgICAtcmV0dXJuIHRydWUgZGlyZWN0bHkgZm9yIGNhc2Ug
KHR5cGU9REFUQV9HRU5FUklDX0VOSEFOQ0VfUkVBRCkgaW4KPiA+Pj4gICAgICBfX2lzX2JpdG1h
cF92YWxpZCB0byBhdm9pZCBtZWFuaW5nbGVzcyBmbG93Cj4gPj4+ICAgICAtcmVuYW1lIF9faXNf
Yml0bWFwX3ZhbGlkIHRvIF9faXNfYml0bWFwX2NoZWNrX3ZhbGlkIGZvciBhdm9pZGluZyBhbWJp
Z3VpdHkKPiA+Pj4gICAgICBhbmQgaGFuZGxpbmcgaXRzIHJldHVybiB2YWx1ZSBpbiB0aGUgY2Fs
bGVyIHVuaWZvcm1seSwgYWxzbyBjb29wZXJhdGUKPiA+Pj4gICAgICBzd2l0Y2ggY2hlY2tpbmcg
dHJ1ZSB0byBmYWxzZSBmb3IgZXJyb3IgY2FzZSBvZgo+ID4+PiAgICAgIGYyZnNfaXNfdmFsaWRf
YmxrYWRkcih0eXBlPURBVEFfR0VORVJJQ19FTkhBTkNFX1VQREFURSkgaW4gZG9fcmVjb3Zlcl9k
YXRhCj4gPj4+ICAgICAgZm9yIG1vcmUgcmVhZGFibGUKPiA+Pj4gY2hhbmdlcyBvZiB2NDogdXBk
YXRlIGFjY29yZGluZyB0byB0aGUgbGF0ZXN0IGNvZGUKPiA+Pj4gY2hhbmdlcyBvZiB2MzoKPiA+
Pj4gICAgIC1yZWJhc2UgcGF0Y2ggdG8gZGV2LXRlc3QKPiA+Pj4gICAgIC1jb3JyZWN0IHJldHVy
biB2YWx1ZSBmb3Igc29tZSBmMmZzX2lzX3ZhbGlkX2Jsa2FkZHIgZXJyb3IgY2FzZQo+ID4+PiBj
aGFuZ2VzIG9mIHYyOiBpbXByb3ZlIHBhdGNoIGFjY29yZGluZyBDaGFvJ3Mgc3VnZ2VzdGlvbnMu
Cj4gPj4+IC0tLQo+ID4+PiAtLS0KPiA+Pj4gICAgZnMvZjJmcy9jaGVja3BvaW50LmMgICB8IDMz
ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ID4+PiAgICBmcy9mMmZzL2RhdGEu
YyAgICAgICAgIHwgMjIgKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+PiAgICBmcy9mMmZzL2V4
dGVudF9jYWNoZS5jIHwgIDUgKy0tLS0KPiA+Pj4gICAgZnMvZjJmcy9maWxlLmMgICAgICAgICB8
IDE2ICsrKy0tLS0tLS0tLS0tLS0KPiA+Pj4gICAgZnMvZjJmcy9nYy5jICAgICAgICAgICB8ICAy
IC0tCj4gPj4+ICAgIGZzL2YyZnMvcmVjb3ZlcnkuYyAgICAgfCAgNCAtLS0tCj4gPj4+ICAgIGZz
L2YyZnMvc2VnbWVudC5jICAgICAgfCAgMiAtLQo+ID4+PiAgICA3IGZpbGVzIGNoYW5nZWQsIDI1
IGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9jaGVja3BvaW50LmMgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+ID4+PiBpbmRleCBi
ODU4MjBlLi4zMzM1NjE5IDEwMDY0NAo+ID4+PiAtLS0gYS9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+
ID4+PiArKysgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+ID4+PiBAQCAtMTU0LDQ2ICsxNTQsNDMg
QEAgc3RhdGljIGJvb2wgX19pc19iaXRtYXBfdmFsaWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBibG9ja190IGJsa2FkZHIsCj4gPj4+ICAgICBpZiAodW5saWtlbHkoZjJmc19jcF9lcnJvcihz
YmkpKSkKPiA+Pj4gICAgICAgICAgICAgcmV0dXJuIGV4aXN0Owo+ID4+PiAtICAgaWYgKGV4aXN0
ICYmIHR5cGUgPT0gREFUQV9HRU5FUklDX0VOSEFOQ0VfVVBEQVRFKSB7Cj4gPj4+IC0gICAgICAg
ICAgIGYyZnNfZXJyKHNiaSwgIkluY29uc2lzdGVudCBlcnJvciBibGthZGRyOiV1LCBzaXQgYml0
bWFwOiVkIiwKPiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgYmxrYWRkciwgZXhpc3QpOwo+ID4+
PiAtICAgICAgICAgICBzZXRfc2JpX2ZsYWcoc2JpLCBTQklfTkVFRF9GU0NLKTsKPiA+Pj4gLSAg
ICAgICAgICAgcmV0dXJuIGV4aXN0Owo+ID4+PiAtICAgfQo+ID4+PiAtCj4gPj4+IC0gICBpZiAo
IWV4aXN0ICYmIHR5cGUgPT0gREFUQV9HRU5FUklDX0VOSEFOQ0UpIHsKPiA+Pj4gKyAgIGlmICgo
ZXhpc3QgJiYgdHlwZSA9PSBEQVRBX0dFTkVSSUNfRU5IQU5DRV9VUERBVEUpIHx8Cj4gPj4+ICsg
ICAgICAgICAgICghZXhpc3QgJiYgdHlwZSA9PSBEQVRBX0dFTkVSSUNfRU5IQU5DRSkpIHsKPiA+
Pj4gICAgICAgICAgICAgZjJmc19lcnIoc2JpLCAiSW5jb25zaXN0ZW50IGVycm9yIGJsa2FkZHI6
JXUsIHNpdCBiaXRtYXA6JWQiLAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICBibGthZGRyLCBl
eGlzdCk7Cj4gPj4+ICAgICAgICAgICAgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9ORUVEX0ZTQ0sp
Owo+ID4+PiAgICAgICAgICAgICBkdW1wX3N0YWNrKCk7Cj4gPj4+ICAgICB9Cj4gPj4+ICsKPiA+
Pgo+ID4+IE5vIG5lZWQgdG8gYWRkIG9uZSBibGFuayBsaW5lLgo+ID4+Cj4gPj4gT3RoZXJ3aXNl
LCBpdCBsb29rcyBnb29kIHRvIG1lLgo+ID4+Cj4gPj4gUmV2aWV3ZWQtYnk6IENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4KPiA+Pgo+ID4+IFRoYW5rcywKPiA+Pgo+ID4+PiAgICAgcmV0dXJuIGV4
aXN0Owo+ID4+PiAgICB9Cj4gPj4+ICAgIHN0YXRpYyBib29sIF9fZjJmc19pc192YWxpZF9ibGth
ZGRyKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYmxvY2tfdCBibGthZGRyLCBpbnQgdHlwZSkKPiA+Pj4gICAgewo+ID4+
PiArICAgYm9vbCB2YWxpZCA9IGZhbHNlOwo+ID4+PiArCj4gPj4+ICAgICBzd2l0Y2ggKHR5cGUp
IHsKPiA+Pj4gICAgIGNhc2UgTUVUQV9OQVQ6Cj4gPj4+ICAgICAgICAgICAgIGJyZWFrOwo+ID4+
PiAgICAgY2FzZSBNRVRBX1NJVDoKPiA+Pj4gICAgICAgICAgICAgaWYgKHVubGlrZWx5KGJsa2Fk
ZHIgPj0gU0lUX0JMS19DTlQoc2JpKSkpCj4gPj4+IC0gICAgICAgICAgICAgICAgICAgcmV0dXJu
IGZhbHNlOwo+ID4+PiArICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4+PiAgICAgICAg
ICAgICBicmVhazsKPiA+Pj4gICAgIGNhc2UgTUVUQV9TU0E6Cj4gPj4+ICAgICAgICAgICAgIGlm
ICh1bmxpa2VseShibGthZGRyID49IE1BSU5fQkxLQUREUihzYmkpIHx8Cj4gPj4+ICAgICAgICAg
ICAgICAgICAgICAgYmxrYWRkciA8IFNNX0koc2JpKS0+c3NhX2Jsa2FkZHIpKQo+ID4+PiAtICAg
ICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICBn
b3RvIGVycjsKPiA+Pj4gICAgICAgICAgICAgYnJlYWs7Cj4gPj4+ICAgICBjYXNlIE1FVEFfQ1A6
Cj4gPj4+ICAgICAgICAgICAgIGlmICh1bmxpa2VseShibGthZGRyID49IFNJVF9JKHNiaSktPnNp
dF9iYXNlX2FkZHIgfHwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICBibGthZGRyIDwgX19zdGFy
dF9jcF9hZGRyKHNiaSkpKQo+ID4+PiAtICAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsK
PiA+Pj4gKyAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+Pj4gICAgICAgICAgICAgYnJl
YWs7Cj4gPj4+ICAgICBjYXNlIE1FVEFfUE9SOgo+ID4+PiAgICAgICAgICAgICBpZiAodW5saWtl
bHkoYmxrYWRkciA+PSBNQVhfQkxLQUREUihzYmkpIHx8Cj4gPj4+ICAgICAgICAgICAgICAgICAg
ICAgYmxrYWRkciA8IE1BSU5fQkxLQUREUihzYmkpKSkKPiA+Pj4gLSAgICAgICAgICAgICAgICAg
ICByZXR1cm4gZmFsc2U7Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgZ290byBlcnI7Cj4gPj4+
ICAgICAgICAgICAgIGJyZWFrOwo+ID4+PiAgICAgY2FzZSBEQVRBX0dFTkVSSUM6Cj4gPj4+ICAg
ICBjYXNlIERBVEFfR0VORVJJQ19FTkhBTkNFOgo+ID4+PiBAQCAtMjEwLDIxICsyMDcsMjcgQEAg
c3RhdGljIGJvb2wgX19mMmZzX2lzX3ZhbGlkX2Jsa2FkZHIoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibGthZGRyKTsKPiA+Pj4g
ICAgICAgICAgICAgICAgICAgICBzZXRfc2JpX2ZsYWcoc2JpLCBTQklfTkVFRF9GU0NLKTsKPiA+
Pj4gICAgICAgICAgICAgICAgICAgICBkdW1wX3N0YWNrKCk7Cj4gPj4+IC0gICAgICAgICAgICAg
ICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+PiArICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+
ID4+PiAgICAgICAgICAgICB9IGVsc2Ugewo+ID4+PiAtICAgICAgICAgICAgICAgICAgIHJldHVy
biBfX2lzX2JpdG1hcF92YWxpZChzYmksIGJsa2FkZHIsIHR5cGUpOwo+ID4+PiArICAgICAgICAg
ICAgICAgICAgIHZhbGlkID0gX19pc19iaXRtYXBfdmFsaWQoc2JpLCBibGthZGRyLCB0eXBlKTsK
PiA+Pj4gKyAgICAgICAgICAgICAgICAgICBpZiAoKCF2YWxpZCAmJiB0eXBlICE9IERBVEFfR0VO
RVJJQ19FTkhBTkNFX1VQREFURSkgfHwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICh2YWxpZCAmJiB0eXBlID09IERBVEFfR0VORVJJQ19FTkhBTkNFX1VQREFURSkpCj4gPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+Cj4gPiBQbGVhc2UgdGhpbmsg
YWJvdXQgaG93IHRvIG9wdGltaXplIHRoaXMsIHdoaWNoIGlzIHJlYWxseSB1Z2x5IG5vdy4KPgo+
IEhvdyBhYm91dCBjYWxsaW5nIGYyZnNfaGFuZGxlX2Vycm9yKHNiaSwgRVJST1JfSU5WQUxJRF9C
TEtBRERSKSBpbnNpZGUKPiBfX2lzX2JpdG1hcF92YWxpZCgpPyBzbyB0aGF0IHdlIG1heSBub3Qg
YWRkIHN1Y2ggbG9naWMgb3V0c2lkZQo+IF9faXNfYml0bWFwX3ZhbGlkKCkuLi4KPgo+IFRoYW5r
cywKCkRlYXIgSmFlZ2V1aywKSSBhZ3JlZSB3aXRoIENoYW8ncyBvcHRpb25zLgpUaGUgb3JpZ2lu
YWwgaW50ZW50aW9uIG9mIHRoaXMgcGF0Y2ggaXMgdGhhdCBzb21lICBmYWlsZWQgY2FzZXMgb2YK
ZjJmc19pc192YWxpZF9ibGthZGRyCmFyZSBub3QgcHJvY2Vzc2VkIGJ5IGYyZnNfaGFuZGxlX2Vy
cm9yLCBzbyBoZXJlIGRvIHVuaWZpZWQgcHJvY2Vzc2luZy4KSXMgaXQgYSBnb29kIHdheSB0byBr
ZWVwIHRoZSBvcmlnaW5hbCBtYWluIGxvZ2ljIG9mIF9faXNfYml0bWFwX3ZhbGlkID8KRG8geW91
IGhhdmUgYW55IG90aGVyIHN1Z2dlc3Rpb25zPwp0aGFua3MhCj4KPiA+Cj4gPj4+ICAgICAgICAg
ICAgIH0KPiA+Pj4gICAgICAgICAgICAgYnJlYWs7Cj4gPj4+ICAgICBjYXNlIE1FVEFfR0VORVJJ
QzoKPiA+Pj4gICAgICAgICAgICAgaWYgKHVubGlrZWx5KGJsa2FkZHIgPCBTRUcwX0JMS0FERFIo
c2JpKSB8fAo+ID4+PiAgICAgICAgICAgICAgICAgICAgIGJsa2FkZHIgPj0gTUFJTl9CTEtBRERS
KHNiaSkpKQo+ID4+PiAtICAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+Pj4gKyAg
ICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+Pj4gICAgICAgICAgICAgYnJlYWs7Cj4gPj4+
ICAgICBkZWZhdWx0Ogo+ID4+PiAgICAgICAgICAgICBCVUcoKTsKPiA+Pj4gICAgIH0KPiA+Pj4g
ICAgIHJldHVybiB0cnVlOwo+ID4+PiArZXJyOgo+ID4+PiArICAgZjJmc19oYW5kbGVfZXJyb3Io
c2JpLCBFUlJPUl9JTlZBTElEX0JMS0FERFIpOwo+ID4+PiArICAgcmV0dXJuIHZhbGlkOwo+ID4+
PiAgICB9Cj4gPj4+ICAgIGJvb2wgZjJmc19pc192YWxpZF9ibGthZGRyKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwKPiA+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9k
YXRhLmMKPiA+Pj4gaW5kZXggMDUxNThmOC4uMzAwZjlhZSAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMv
ZjJmcy9kYXRhLmMKPiA+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+Pj4gQEAgLTczOCwxMCAr
NzM4LDggQEAgaW50IGYyZnNfc3VibWl0X3BhZ2VfYmlvKHN0cnVjdCBmMmZzX2lvX2luZm8gKmZp
bykKPiA+Pj4gICAgIGlmICghZjJmc19pc192YWxpZF9ibGthZGRyKGZpby0+c2JpLCBmaW8tPm5l
d19ibGthZGRyLAo+ID4+PiAgICAgICAgICAgICAgICAgICAgIGZpby0+aXNfcG9yID8gTUVUQV9Q
T1IgOiAoX19pc19tZXRhX2lvKGZpbykgPwo+ID4+PiAtICAgICAgICAgICAgICAgICAgIE1FVEFf
R0VORVJJQyA6IERBVEFfR0VORVJJQ19FTkhBTkNFKSkpIHsKPiA+Pj4gLSAgICAgICAgICAgZjJm
c19oYW5kbGVfZXJyb3IoZmlvLT5zYmksIEVSUk9SX0lOVkFMSURfQkxLQUREUik7Cj4gPj4+ICsg
ICAgICAgICAgICAgICAgICAgTUVUQV9HRU5FUklDIDogREFUQV9HRU5FUklDX0VOSEFOQ0UpKSkK
PiA+Pj4gICAgICAgICAgICAgcmV0dXJuIC1FRlNDT1JSVVBURUQ7Cj4gPj4+IC0gICB9Cj4gPj4+
ICAgICB0cmFjZV9mMmZzX3N1Ym1pdF9wYWdlX2JpbyhwYWdlLCBmaW8pOwo+ID4+PiBAQCAtOTQ2
LDEwICs5NDQsOCBAQCBpbnQgZjJmc19tZXJnZV9wYWdlX2JpbyhzdHJ1Y3QgZjJmc19pb19pbmZv
ICpmaW8pCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgZmlvLT5lbmNyeXB0ZWRfcGFnZSA6IGZp
by0+cGFnZTsKPiA+Pj4gICAgIGlmICghZjJmc19pc192YWxpZF9ibGthZGRyKGZpby0+c2JpLCBm
aW8tPm5ld19ibGthZGRyLAo+ID4+PiAtICAgICAgICAgICAgICAgICAgIF9faXNfbWV0YV9pbyhm
aW8pID8gTUVUQV9HRU5FUklDIDogREFUQV9HRU5FUklDKSkgewo+ID4+PiAtICAgICAgICAgICBm
MmZzX2hhbmRsZV9lcnJvcihmaW8tPnNiaSwgRVJST1JfSU5WQUxJRF9CTEtBRERSKTsKPiA+Pj4g
KyAgICAgICAgICAgICAgICAgICBfX2lzX21ldGFfaW8oZmlvKSA/IE1FVEFfR0VORVJJQyA6IERB
VEFfR0VORVJJQykpCj4gPj4+ICAgICAgICAgICAgIHJldHVybiAtRUZTQ09SUlVQVEVEOwo+ID4+
PiAtICAgfQo+ID4+PiAgICAgdHJhY2VfZjJmc19zdWJtaXRfcGFnZV9iaW8ocGFnZSwgZmlvKTsK
PiA+Pj4gQEAgLTEyODYsOCArMTI4Miw2IEBAIHN0cnVjdCBwYWdlICpmMmZzX2dldF9yZWFkX2Rh
dGFfcGFnZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBwZ29mZl90IGluZGV4LAo+ID4+PiAgICAgICAg
ICAgICBpZiAoIWYyZnNfaXNfdmFsaWRfYmxrYWRkcihGMkZTX0lfU0IoaW5vZGUpLCBkbi5kYXRh
X2Jsa2FkZHIsCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgREFUQV9HRU5FUklDX0VOSEFOQ0VfUkVBRCkpIHsKPiA+Pj4gICAgICAgICAgICAgICAgICAg
ICBlcnIgPSAtRUZTQ09SUlVQVEVEOwo+ID4+PiAtICAgICAgICAgICAgICAgICAgIGYyZnNfaGFu
ZGxlX2Vycm9yKEYyRlNfSV9TQihpbm9kZSksCj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgRVJST1JfSU5WQUxJRF9CTEtBRERSKTsKPiA+Pj4gICAgICAg
ICAgICAgICAgICAgICBnb3RvIHB1dF9lcnI7Cj4gPj4+ICAgICAgICAgICAgIH0KPiA+Pj4gICAg
ICAgICAgICAgZ290byBnb3RfaXQ7Cj4gPj4+IEBAIC0xMzEzLDggKzEzMDcsNiBAQCBzdHJ1Y3Qg
cGFnZSAqZjJmc19nZXRfcmVhZF9kYXRhX3BhZ2Uoc3RydWN0IGlub2RlICppbm9kZSwgcGdvZmZf
dCBpbmRleCwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBkbi5kYXRhX2Jsa2FkZHIsCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgREFUQV9HRU5FUklDX0VOSEFOQ0UpKSB7Cj4gPj4+ICAgICAgICAgICAgIGVy
ciA9IC1FRlNDT1JSVVBURUQ7Cj4gPj4+IC0gICAgICAgICAgIGYyZnNfaGFuZGxlX2Vycm9yKEYy
RlNfSV9TQihpbm9kZSksCj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEVSUk9SX0lOVkFMSURfQkxLQUREUik7Cj4gPj4+ICAgICAgICAgICAgIGdvdG8gcHV0X2VycjsK
PiA+Pj4gICAgIH0KPiA+Pj4gICAgZ290X2l0Ogo+ID4+PiBAQCAtMTY0Miw3ICsxNjM0LDYgQEAg
aW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBf
YmxvY2tzICptYXAsIGludCBmbGFnKQo+ID4+PiAgICAgaWYgKCFpc19ob2xlICYmCj4gPj4+ICAg
ICAgICAgIWYyZnNfaXNfdmFsaWRfYmxrYWRkcihzYmksIGJsa2FkZHIsIERBVEFfR0VORVJJQ19F
TkhBTkNFKSkgewo+ID4+PiAgICAgICAgICAgICBlcnIgPSAtRUZTQ09SUlVQVEVEOwo+ID4+PiAt
ICAgICAgICAgICBmMmZzX2hhbmRsZV9lcnJvcihzYmksIEVSUk9SX0lOVkFMSURfQkxLQUREUik7
Cj4gPj4+ICAgICAgICAgICAgIGdvdG8gc3luY19vdXQ7Cj4gPj4+ICAgICB9Cj4gPj4+IEBAIC0y
MTY2LDggKzIxNTcsNiBAQCBzdGF0aWMgaW50IGYyZnNfcmVhZF9zaW5nbGVfcGFnZShzdHJ1Y3Qg
aW5vZGUgKmlub2RlLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKPiA+Pj4gICAgICAgICAgICAgaWYgKCFm
MmZzX2lzX3ZhbGlkX2Jsa2FkZHIoRjJGU19JX1NCKGlub2RlKSwgYmxvY2tfbnIsCj4gPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgREFUQV9HRU5FUklDX0VO
SEFOQ0VfUkVBRCkpIHsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUZTQ09SUlVQ
VEVEOwo+ID4+PiAtICAgICAgICAgICAgICAgICAgIGYyZnNfaGFuZGxlX2Vycm9yKEYyRlNfSV9T
Qihpbm9kZSksCj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgRVJST1JfSU5WQUxJRF9CTEtBRERSKTsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICBnb3Rv
IG91dDsKPiA+Pj4gICAgICAgICAgICAgfQo+ID4+PiAgICAgfSBlbHNlIHsKPiA+Pj4gQEAgLTI3
MDcsMTEgKzI2OTYsOCBAQCBpbnQgZjJmc19kb193cml0ZV9kYXRhX3BhZ2Uoc3RydWN0IGYyZnNf
aW9faW5mbyAqZmlvKQo+ID4+PiAgICAgICAgIGYyZnNfbG9va3VwX3JlYWRfZXh0ZW50X2NhY2hl
X2Jsb2NrKGlub2RlLCBwYWdlLT5pbmRleCwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmZmlvLT5vbGRfYmxrYWRkcikpIHsKPiA+Pj4gICAgICAgICAg
ICAgaWYgKCFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHIoZmlvLT5zYmksIGZpby0+b2xkX2Jsa2FkZHIs
Cj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgREFUQV9H
RU5FUklDX0VOSEFOQ0UpKSB7Cj4gPj4+IC0gICAgICAgICAgICAgICAgICAgZjJmc19oYW5kbGVf
ZXJyb3IoZmlvLT5zYmksCj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgRVJST1JfSU5WQUxJRF9CTEtBRERSKTsKPiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBEQVRBX0dFTkVSSUNfRU5IQU5DRSkpCj4gPj4+ICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FRlNDT1JSVVBURUQ7Cj4gPj4+IC0gICAgICAgICAg
IH0KPiA+Pj4gICAgICAgICAgICAgaXB1X2ZvcmNlID0gdHJ1ZTsKPiA+Pj4gICAgICAgICAgICAg
ZmlvLT5uZWVkX2xvY2sgPSBMT0NLX0RPTkU7Cj4gPj4+IEBAIC0yNzM5LDcgKzI3MjUsNiBAQCBp
bnQgZjJmc19kb193cml0ZV9kYXRhX3BhZ2Uoc3RydWN0IGYyZnNfaW9faW5mbyAqZmlvKQo+ID4+
PiAgICAgICAgICAgICAhZjJmc19pc192YWxpZF9ibGthZGRyKGZpby0+c2JpLCBmaW8tPm9sZF9i
bGthZGRyLAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IERBVEFfR0VORVJJQ19FTkhBTkNFKSkgewo+ID4+PiAgICAgICAgICAgICBlcnIgPSAtRUZTQ09S
UlVQVEVEOwo+ID4+PiAtICAgICAgICAgICBmMmZzX2hhbmRsZV9lcnJvcihmaW8tPnNiaSwgRVJS
T1JfSU5WQUxJRF9CTEtBRERSKTsKPiA+Pj4gICAgICAgICAgICAgZ290byBvdXRfd3JpdGVwYWdl
Owo+ID4+PiAgICAgfQo+ID4+PiBAQCAtMzcwNiw3ICszNjkxLDYgQEAgc3RhdGljIGludCBmMmZz
X3dyaXRlX2JlZ2luKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFw
cGluZywKPiA+Pj4gICAgICAgICAgICAgaWYgKCFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHIoc2JpLCBi
bGthZGRyLAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgREFUQV9HRU5FUklDX0VO
SEFOQ0VfUkVBRCkpIHsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICBlcnIgPSAtRUZTQ09SUlVQ
VEVEOwo+ID4+PiAtICAgICAgICAgICAgICAgICAgIGYyZnNfaGFuZGxlX2Vycm9yKHNiaSwgRVJS
T1JfSU5WQUxJRF9CTEtBRERSKTsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICBnb3RvIGZhaWw7
Cj4gPj4+ICAgICAgICAgICAgIH0KPiA+Pj4gICAgICAgICAgICAgZXJyID0gZjJmc19zdWJtaXRf
cGFnZV9yZWFkKHVzZV9jb3cgPwo+ID4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9leHRlbnRfY2Fj
aGUuYyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPiA+Pj4gaW5kZXggYWQ4ZGZhYzcuLjQ4MDQ4
ZmEgMTAwNjQ0Cj4gPj4+IC0tLSBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPiA+Pj4gKysrIGIv
ZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+ID4+PiBAQCAtNDMsNyArNDMsNiBAQCBib29sIHNhbml0
eV9jaGVja19leHRlbnRfY2FjaGUoc3RydWN0IGlub2RlICppbm9kZSkKPiA+Pj4gICAgIGlmICgh
ZjJmc19pc192YWxpZF9ibGthZGRyKHNiaSwgZWktPmJsaywgREFUQV9HRU5FUklDX0VOSEFOQ0Up
IHx8Cj4gPj4+ICAgICAgICAgIWYyZnNfaXNfdmFsaWRfYmxrYWRkcihzYmksIGVpLT5ibGsgKyBl
aS0+bGVuIC0gMSwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgREFU
QV9HRU5FUklDX0VOSEFOQ0UpKSB7Cj4gPj4+IC0gICAgICAgICAgIHNldF9zYmlfZmxhZyhzYmks
IFNCSV9ORUVEX0ZTQ0spOwo+ID4+PiAgICAgICAgICAgICBmMmZzX3dhcm4oc2JpLCAiJXM6IGlu
b2RlIChpbm89JWx4KSBleHRlbnQgaW5mbyBbJXUsICV1LCAldV0gaXMgaW5jb3JyZWN0LCBydW4g
ZnNjayB0byBmaXgiLAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGlub2Rl
LT5pX2lubywKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgIGVpLT5ibGssIGVpLT5mb2ZzLCBl
aS0+bGVuKTsKPiA+Pj4gQEAgLTg1NiwxMCArODU1LDggQEAgc3RhdGljIGludCBfX2dldF9uZXdf
YmxvY2tfYWdlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBleHRlbnRfaW5mbyAqZWksCj4g
Pj4+ICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4+PiAgICAgaWYgKF9faXNfdmFsaWRfZGF0YV9i
bGthZGRyKGJsa2FkZHIpICYmCj4gPj4+IC0gICAgICAgIWYyZnNfaXNfdmFsaWRfYmxrYWRkcihz
YmksIGJsa2FkZHIsIERBVEFfR0VORVJJQ19FTkhBTkNFKSkgewo+ID4+PiAtICAgICAgICAgICBm
MmZzX2J1Z19vbihzYmksIDEpOwo+ID4+PiArICAgICAgICFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHIo
c2JpLCBibGthZGRyLCBEQVRBX0dFTkVSSUNfRU5IQU5DRSkpCj4gPj4+ICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ID4+PiAtICAgfQo+ID4+PiAgICBvdXQ6Cj4gPj4+ICAgICAvKgo+ID4+
PiAgICAgICogaW5pdCBibG9jayBhZ2Ugd2l0aCB6ZXJvLCB0aGlzIGNhbiBoYXBwZW4gd2hlbiB0
aGUgYmxvY2sgYWdlIGV4dGVudAo+ID4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9m
cy9mMmZzL2ZpbGUuYwo+ID4+PiBpbmRleCAyNWIxMTljZi4uMjNjZDZhMSAxMDA2NDQKPiA+Pj4g
LS0tIGEvZnMvZjJmcy9maWxlLmMKPiA+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiA+Pj4gQEAg
LTU5MywxMCArNTkzLDggQEAgdm9pZCBmMmZzX3RydW5jYXRlX2RhdGFfYmxvY2tzX3JhbmdlKHN0
cnVjdCBkbm9kZV9vZl9kYXRhICpkbiwgaW50IGNvdW50KQo+ID4+PiAgICAgICAgICAgICAgICAg
ICAgIGlmICh0aW1lX3RvX2luamVjdChzYmksIEZBVUxUX0JMS0FERFJfQ09OU0lTVEVOQ0UpKQo+
ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPj4+ICAgICAgICAg
ICAgICAgICAgICAgaWYgKCFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHJfcmF3KHNiaSwgYmxrYWRkciwK
PiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEQVRBX0dF
TkVSSUNfRU5IQU5DRSkpIHsKPiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNf
aGFuZGxlX2Vycm9yKHNiaSwgRVJST1JfSU5WQUxJRF9CTEtBRERSKTsKPiA+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEQVRBX0dFTkVSSUNfRU5IQU5DRSkp
Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+Pj4gLSAgICAg
ICAgICAgICAgICAgICB9Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgaWYgKGNvbXByZXNzZWRf
Y2x1c3RlcikKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbGlkX2Jsb2Nrcysr
Owo+ID4+PiAgICAgICAgICAgICB9Cj4gPj4+IEBAIC0xMTk2LDcgKzExOTQsNiBAQCBzdGF0aWMg
aW50IF9fcmVhZF9vdXRfYmxrYWRkcnMoc3RydWN0IGlub2RlICppbm9kZSwgYmxvY2tfdCAqYmxr
YWRkciwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAhZjJmc19pc192YWxpZF9ibGthZGRyKHNi
aSwgKmJsa2FkZHIsCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERB
VEFfR0VORVJJQ19FTkhBTkNFKSkgewo+ID4+PiAgICAgICAgICAgICAgICAgICAgIGYyZnNfcHV0
X2Rub2RlKCZkbik7Cj4gPj4+IC0gICAgICAgICAgICAgICAgICAgZjJmc19oYW5kbGVfZXJyb3Io
c2JpLCBFUlJPUl9JTlZBTElEX0JMS0FERFIpOwo+ID4+PiAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRUZTQ09SUlVQVEVEOwo+ID4+PiAgICAgICAgICAgICB9Cj4gPj4+IEBAIC0xNDgyLDcg
KzE0NzksNiBAQCBzdGF0aWMgaW50IGYyZnNfZG9femVyb19yYW5nZShzdHJ1Y3QgZG5vZGVfb2Zf
ZGF0YSAqZG4sIHBnb2ZmX3Qgc3RhcnQsCj4gPj4+ICAgICAgICAgICAgIGlmICghZjJmc19pc192
YWxpZF9ibGthZGRyKHNiaSwgZG4tPmRhdGFfYmxrYWRkciwKPiA+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgREFUQV9HRU5FUklDX0VOSEFOQ0UpKSB7Cj4gPj4+ICAgICAg
ICAgICAgICAgICAgICAgcmV0ID0gLUVGU0NPUlJVUFRFRDsKPiA+Pj4gLSAgICAgICAgICAgICAg
ICAgICBmMmZzX2hhbmRsZV9lcnJvcihzYmksIEVSUk9SX0lOVkFMSURfQkxLQUREUik7Cj4gPj4+
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPj4+ICAgICAgICAgICAgIH0KPiA+Pj4gQEAg
LTM0NDIsMTAgKzM0MzgsOCBAQCBzdGF0aWMgaW50IHJlbGVhc2VfY29tcHJlc3NfYmxvY2tzKHN0
cnVjdCBkbm9kZV9vZl9kYXRhICpkbiwgcGdvZmZfdCBjb3VudCkKPiA+Pj4gICAgICAgICAgICAg
aWYgKCFfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihibGthZGRyKSkKPiA+Pj4gICAgICAgICAgICAg
ICAgICAgICBjb250aW51ZTsKPiA+Pj4gICAgICAgICAgICAgaWYgKHVubGlrZWx5KCFmMmZzX2lz
X3ZhbGlkX2Jsa2FkZHIoc2JpLCBibGthZGRyLAo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBEQVRBX0dFTkVSSUNfRU5IQU5DRSkpKSB7Cj4gPj4+IC0gICAgICAgICAg
ICAgICAgICAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLCBFUlJPUl9JTlZBTElEX0JMS0FERFIpOwo+
ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEQVRBX0dFTkVSSUNfRU5I
QU5DRSkpKQo+ID4+PiAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUZTQ09SUlVQVEVEOwo+
ID4+PiAtICAgICAgICAgICB9Cj4gPj4+ICAgICB9Cj4gPj4+ICAgICB3aGlsZSAoY291bnQpIHsK
PiA+Pj4gQEAgLTM2MDcsMTAgKzM2MDEsOCBAQCBzdGF0aWMgaW50IHJlc2VydmVfY29tcHJlc3Nf
YmxvY2tzKHN0cnVjdCBkbm9kZV9vZl9kYXRhICpkbiwgcGdvZmZfdCBjb3VudCkKPiA+Pj4gICAg
ICAgICAgICAgaWYgKCFfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihibGthZGRyKSkKPiA+Pj4gICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+Pj4gICAgICAgICAgICAgaWYgKHVubGlrZWx5
KCFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHIoc2JpLCBibGthZGRyLAo+ID4+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBEQVRBX0dFTkVSSUNfRU5IQU5DRSkpKSB7Cj4gPj4+IC0g
ICAgICAgICAgICAgICAgICAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLCBFUlJPUl9JTlZBTElEX0JM
S0FERFIpOwo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEQVRBX0dF
TkVSSUNfRU5IQU5DRSkpKQo+ID4+PiAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUZTQ09S
UlVQVEVEOwo+ID4+PiAtICAgICAgICAgICB9Cj4gPj4+ICAgICB9Cj4gPj4+ICAgICB3aGlsZSAo
Y291bnQpIHsKPiA+Pj4gQEAgLTM4OTQsOCArMzg4Niw2IEBAIHN0YXRpYyBpbnQgZjJmc19zZWNf
dHJpbV9maWxlKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPiA+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEQVRBX0dFTkVSSUNfRU5I
QU5DRSkpIHsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FRlNDT1JS
VVBURUQ7Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmMmZzX3B1dF9kbm9kZSgm
ZG4pOwo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19oYW5kbGVfZXJyb3Io
c2JpLAo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVS
Uk9SX0lOVkFMSURfQkxLQUREUik7Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBn
b3RvIG91dDsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICB9Cj4gPj4+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL2djLmMgYi9mcy9mMmZzL2djLmMKPiA+Pj4gaW5kZXggYTA3OWVlYi4uMzBlOTNkOCAx
MDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4gPj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+
ID4+PiBAQCAtMTE5Nyw3ICsxMTk3LDYgQEAgc3RhdGljIGludCByYV9kYXRhX2Jsb2NrKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIHBnb2ZmX3QgaW5kZXgpCj4gPj4+ICAgICAgICAgICAgIGlmICh1bmxp
a2VseSghZjJmc19pc192YWxpZF9ibGthZGRyKHNiaSwgZG4uZGF0YV9ibGthZGRyLAo+ID4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERBVEFfR0VORVJJQ19F
TkhBTkNFX1JFQUQpKSkgewo+ID4+PiAgICAgICAgICAgICAgICAgICAgIGVyciA9IC1FRlNDT1JS
VVBURUQ7Cj4gPj4+IC0gICAgICAgICAgICAgICAgICAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLCBF
UlJPUl9JTlZBTElEX0JMS0FERFIpOwo+ID4+PiAgICAgICAgICAgICAgICAgICAgIGdvdG8gcHV0
X3BhZ2U7Cj4gPj4+ICAgICAgICAgICAgIH0KPiA+Pj4gICAgICAgICAgICAgZ290byBnb3RfaXQ7
Cj4gPj4+IEBAIC0xMjE2LDcgKzEyMTUsNiBAQCBzdGF0aWMgaW50IHJhX2RhdGFfYmxvY2soc3Ry
dWN0IGlub2RlICppbm9kZSwgcGdvZmZfdCBpbmRleCkKPiA+Pj4gICAgIGlmICh1bmxpa2VseSgh
ZjJmc19pc192YWxpZF9ibGthZGRyKHNiaSwgZG4uZGF0YV9ibGthZGRyLAo+ID4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERBVEFfR0VORVJJQ19FTkhBTkNF
KSkpIHsKPiA+Pj4gICAgICAgICAgICAgZXJyID0gLUVGU0NPUlJVUFRFRDsKPiA+Pj4gLSAgICAg
ICAgICAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLCBFUlJPUl9JTlZBTElEX0JMS0FERFIpOwo+ID4+
PiAgICAgICAgICAgICBnb3RvIHB1dF9wYWdlOwo+ID4+PiAgICAgfQo+ID4+PiAgICBnb3RfaXQ6
Cj4gPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3JlY292ZXJ5LmMgYi9mcy9mMmZzL3JlY292ZXJ5
LmMKPiA+Pj4gaW5kZXggYWFkMWQxYS4uMjg5YzBiZiAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJm
cy9yZWNvdmVyeS5jCj4gPj4+ICsrKyBiL2ZzL2YyZnMvcmVjb3ZlcnkuYwo+ID4+PiBAQCAtNjkz
LDE0ICs2OTMsMTIgQEAgc3RhdGljIGludCBkb19yZWNvdmVyX2RhdGEoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ID4+PiAgICAgICAgICAgICBpZiAoX19p
c192YWxpZF9kYXRhX2Jsa2FkZHIoc3JjKSAmJgo+ID4+PiAgICAgICAgICAgICAgICAgICAgICFm
MmZzX2lzX3ZhbGlkX2Jsa2FkZHIoc2JpLCBzcmMsIE1FVEFfUE9SKSkgewo+ID4+PiAgICAgICAg
ICAgICAgICAgICAgIGVyciA9IC1FRlNDT1JSVVBURUQ7Cj4gPj4+IC0gICAgICAgICAgICAgICAg
ICAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLCBFUlJPUl9JTlZBTElEX0JMS0FERFIpOwo+ID4+PiAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4+PiAgICAgICAgICAgICB9Cj4gPj4+ICAg
ICAgICAgICAgIGlmIChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihkZXN0KSAmJgo+ID4+PiAgICAg
ICAgICAgICAgICAgICAgICFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHIoc2JpLCBkZXN0LCBNRVRBX1BP
UikpIHsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICBlcnIgPSAtRUZTQ09SUlVQVEVEOwo+ID4+
PiAtICAgICAgICAgICAgICAgICAgIGYyZnNfaGFuZGxlX2Vycm9yKHNiaSwgRVJST1JfSU5WQUxJ
RF9CTEtBRERSKTsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+Pj4gICAg
ICAgICAgICAgfQo+ID4+PiBAQCAtNzU1LDggKzc1Myw2IEBAIHN0YXRpYyBpbnQgZG9fcmVjb3Zl
cl9kYXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGlub2RlICppbm9kZSwKPiA+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfZXJyKHNiaSwgIkluY29uc2lzdGVu
dCBkZXN0IGJsa2FkZHI6JXUsIGlubzolbHUsIG9mczoldSIsCj4gPj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRlc3QsIGlub2RlLT5pX2lubywgZG4ub2ZzX2luX25vZGUp
Owo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gLUVGU0NPUlJVUFRFRDsK
PiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfaGFuZGxlX2Vycm9yKHNiaSwK
PiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFUlJPUl9J
TlZBTElEX0JMS0FERFIpOwo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBl
cnI7Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgfQo+ID4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+ID4+PiBpbmRleCA3OTAxZWRlLi5hZDY1
MTFmIDEwMDY0NAo+ID4+PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ID4+PiArKysgYi9mcy9m
MmZzL3NlZ21lbnQuYwo+ID4+PiBAQCAtMzM0LDggKzMzNCw2IEBAIHN0YXRpYyBpbnQgX19mMmZz
X2NvbW1pdF9hdG9taWNfd3JpdGUoc3RydWN0IGlub2RlICppbm9kZSkKPiA+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgREFUQV9HRU5FUklDX0VOSEFOQ0UpKSB7Cj4gPj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmMmZzX3B1dF9kbm9kZSgmZG4pOwo+ID4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVGU0NPUlJVUFRFRDsKPiA+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfaGFuZGxlX2Vycm9yKHNiaSwKPiA+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFUlJPUl9JTlZBTElEX0JM
S0FERFIpOwo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPj4+
ICAgICAgICAgICAgICAgICAgICAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
