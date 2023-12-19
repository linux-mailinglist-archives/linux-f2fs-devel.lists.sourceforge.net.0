Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B31818062
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Dec 2023 05:09:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFRQH-0000X5-8x;
	Tue, 19 Dec 2023 04:09:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rFRQG-0000Wz-3v
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 04:09:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z9zHDHO13PjWbb8KHC4s3wKUUXJJ6KzWnl5bkPnl1h8=; b=PPUOQWMurF8Pz2aBLqe7uJ+tOA
 5J9DzO6zvBDCQfdc/23MzUygSffxkRHGAtchs9N4WX47Efqti1pmdrIEUD+UlHQEuHKxKgf78GCRE
 hUrbotDagzFn4tyBc2N7L9YOdpO1yK2V9uQTjk/0OJIxPQzTFHgRFK0qIn4qyFbSqmS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z9zHDHO13PjWbb8KHC4s3wKUUXJJ6KzWnl5bkPnl1h8=; b=AFC4szPFLcGHZsB4wnMelwfl5x
 51KePnQT9zrrZxtfQQLoVnhTfvoV0kgP9NpZr0Zf/pS6vQn+07qL/anwt1/ViUVRBDWdQnbDmDfG5
 OcAxjOZAKgtjVfAH9mII9DALkaH+rsVFGIlUJmqs7R0cz2GPNK73vz6Uz/jZQwgwQ+zI=;
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rFRQF-0002Lk-Ne for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 04:09:36 +0000
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-54bf9a54fe3so4852634a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Dec 2023 20:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702958964; x=1703563764; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z9zHDHO13PjWbb8KHC4s3wKUUXJJ6KzWnl5bkPnl1h8=;
 b=ecHv7xVOo71li4Nnzy1xYtk0FB0mNHSwWjSnAAKvn0zDNcrXb2lRpqWbrWuXlEiKe4
 jvyzQUBA0QCvh4cSWiEIdkNtaBcds0/XRCcT8P3qtYCuOdilD4w/a12COXcGz8bipuy+
 /fNshvX+k26SJ+EvkV78/FDym29lUI/BOYRoMq5eGghI9G/E3ms8WLkwK6AMhuSl21eA
 BbKIartUFnzm9z0qJu47rg9t8CCGZvaBRvNeWD6rv+GKDS4zuhM58XLOaNVQbhBNh1+W
 XhE23ufjREsTPlcZcvZrebmW0j14ULncWWKL4fH8FX552D64hUpudRmxXpnDCxfPie84
 i6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702958964; x=1703563764;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z9zHDHO13PjWbb8KHC4s3wKUUXJJ6KzWnl5bkPnl1h8=;
 b=n9W4tEtRV3rAapa3lh3XrThozuxze+vcw+1I7tuD0cT9+cNPs8KUaXPrMl8zdii/fF
 iOVHSfNXCm4azpMv4OquWhFgYLjnMmt030RM74ZcKisk0usFs4mDwyWc2KB7YDJxlBYi
 2zi5YO4Wc5oidiOJkWGdo15u+aGhX1vU8fnWCJk0Xt0FO/4jQr7QksKpC0d0GJP7iB7s
 jnoG67h+9jTCYktURfCZl74j51YvP/SGWpa2M61AmSvbiSjPmRSbwTLSMI7QyBMBzHK7
 6vch9nLVjuB1JXvzpNhMzZJzi4V8nQQLMgmnMRx0KTDIJBd/7/Kk3jdGrkz7o9KMYBBc
 Z7hQ==
X-Gm-Message-State: AOJu0YxFVKEQKKl3B1qE/wDhkLHZR/AH8VhYRQ5UyAjDhADqdu4ieIBP
 ogPHqn13uCGl54K9111HAMd48KDxb2CPD3ShypRz+/2VzOM=
X-Google-Smtp-Source: AGHT+IFiuuV9fgrhO2LvtNhi2Ggp6UadwZA3xMpQGF68AkzGPueMilXlEIPqu4wbZ1OOOb1hUrKAtIVsba4Jk85BU4o=
X-Received: by 2002:a50:d69b:0:b0:553:9cb9:a3d6 with SMTP id
 r27-20020a50d69b000000b005539cb9a3d6mr73172edi.8.1702958964032; Mon, 18 Dec
 2023 20:09:24 -0800 (PST)
MIME-Version: 1.0
References: <1702952464-22050-1-git-send-email-zhiguo.niu@unisoc.com>
 <6c553a75-4842-4b28-9725-ba5e297ff793@kernel.org>
In-Reply-To: <6c553a75-4842-4b28-9725-ba5e297ff793@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 19 Dec 2023 12:09:12 +0800
Message-ID: <CAHJ8P3LgQB9Q_TQj0nmjKXLsk95uVA2xvPXdvpK8Gjsonz-fHg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Dec 19, 2023 at 12:00 PM Chao Yu wrote: > > On 2023/12/19
    10:21, Zhiguo Niu wrote: > > The current pending_discard attr just only shows
    the discard_cmd_cnt > > information. More discard st [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.49 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rFRQF-0002Lk-Ne
Subject: Re: [f2fs-dev] [PATCH V4] f2fs: show more discard status by sysfs
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBEZWMgMTksIDIwMjMgYXQgMTI6MDDigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gMjAyMy8xMi8xOSAxMDoyMSwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+
IFRoZSBjdXJyZW50IHBlbmRpbmdfZGlzY2FyZCBhdHRyIGp1c3Qgb25seSBzaG93cyB0aGUgZGlz
Y2FyZF9jbWRfY250Cj4gPiBpbmZvcm1hdGlvbi4gTW9yZSBkaXNjYXJkIHN0YXR1cyBjYW4gYmUg
c2hvd24gc28gdGhhdCB3ZSBjYW4gY2hlY2sKPiA+IHRoZW0gdGhyb3VnaCBzeXNmcyB3aGVuIG5l
ZWRlZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNv
Yy5jb20+Cj4gPiAtLS0KPiA+IGNoYW5nZXMgb2YgdjI6IEltcHJvdmUgdGhlIHBhdGNoIGFjY29y
ZGluZyB0byBDaGFvJ3Mgc3VnZ2VzdGlvbnMuCj4gPiBjaGFuZ2VzIG9mIHYzOiBBZGQgYSBibGFu
ayBsaW5lIGZvciBlYXN5IHJlYWRpbmcuCj4gPiBjaGFuZ2VzIG9mIHY0OiBTcGxpdCB0byB0aHJl
ZSBlbnRyaWVzCj4gPiAtLS0KPiA+IC0tLQo+ID4gICBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5n
L3N5c2ZzLWZzLWYyZnMgfCAxNSArKysrKysrKysrKysrKysKPiA+ICAgZnMvZjJmcy9zeXNmcy5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMgYi9Eb2N1
bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPiA+IGluZGV4IDRmMWQ0ZTYuLjYw
NmEyOTggMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZz
LWYyZnMKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+
ID4gQEAgLTE1OSw2ICsxNTksMjEgQEAgRGF0ZTogICAgICAgICAgICBOb3ZlbWJlciAyMDIxCj4g
PiAgIENvbnRhY3Q6ICAgICJKYWVnZXVrIEtpbSIgPGphZWdldWtAa2VybmVsLm9yZz4KPiA+ICAg
RGVzY3JpcHRpb246ICAgICAgICBTaG93cyB0aGUgbnVtYmVyIG9mIHBlbmRpbmcgZGlzY2FyZCBj
b21tYW5kcyBpbiB0aGUgcXVldWUuCj4gPgo+ID4gK1doYXQ6ICAgICAgICAgICAvc3lzL2ZzL2Yy
ZnMvPGRpc2s+L2lzc3VlZF9kaXNjYXJkCj4KPiBBZGQgdGhlbSB0byAvc3lzL2ZzL2YyZnMvPGRp
c2s+L3N0YXQvPwpJIGp1c3Qgd2FudCB0byBrZWVwIHRoZW0gY29uc2lzdGVudCB3aXRoIHRoZSBl
bnRyeSAicGVuZGluZ19kaXNjYXJkIgppZiB0aGV5IGFyZSBzcGxpdCB0byAzIGVudHJpZXMuCnRo
ZXkgYXJlIGFsbCBkaXNjYXJkIHJlbGF0ZWQgaW5mb3MuClRoYW5rcwo+Cj4gVGhhbmtzLAo+Cj4g
PiArRGF0ZTogICAgICAgICAgIERlY2VtYmVyIDIwMjMKPiA+ICtDb250YWN0OiAgICAgICAgIlpo
aWd1byBOaXUiIDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gPiArRGVzY3JpcHRpb246ICAgIFNo
b3dzIHRoZSBudW1iZXIgb2YgaXNzdWVkIGRpc2NhcmQuCj4gPiArCj4gPiArV2hhdDogICAgICAg
ICAgIC9zeXMvZnMvZjJmcy88ZGlzaz4vcXVldWVkX2Rpc2NhcmQKPiA+ICtEYXRlOiAgICAgICAg
ICAgRGVjZW1iZXIgMjAyMwo+ID4gK0NvbnRhY3Q6ICAgICAgICAiWmhpZ3VvIE5pdSIgPHpoaWd1
by5uaXVAdW5pc29jLmNvbT4KPiA+ICtEZXNjcmlwdGlvbjogICAgU2hvd3MgdGhlIG51bWJlciBv
ZiBxdWV1ZWQgZGlzY2FyZC4KPiA+ICsKPiA+ICtXaGF0OiAgICAgICAgICAgL3N5cy9mcy9mMmZz
LzxkaXNrPi91bmRpc2NhcmRfYmxrcwo+ID4gK0RhdGU6ICAgICAgICAgICBEZWNlbWJlciAyMDIz
Cj4gPiArQ29udGFjdDogICAgICAgICJaaGlndW8gTml1IiA8emhpZ3VvLm5pdUB1bmlzb2MuY29t
Pgo+ID4gK0Rlc2NyaXB0aW9uOiAgICBTaG93cyB0aGUgdG90YWwgbnVtYmVyIG9mIHVuZGlzY2Fy
ZCBibG9ja3MuCj4gPiArCj4gPiAgIFdoYXQ6ICAgICAgICAgICAgICAgL3N5cy9mcy9mMmZzLzxk
aXNrPi9tYXhfdmljdGltX3NlYXJjaAo+ID4gICBEYXRlOiAgICAgICAgICAgICAgIEphbnVhcnkg
MjAxNAo+ID4gICBDb250YWN0OiAgICAiSmFlZ2V1ayBLaW0iIDxqYWVnZXVrLmtpbUBzYW1zdW5n
LmNvbT4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N5c2ZzLmMgYi9mcy9mMmZzL3N5c2ZzLmMK
PiA+IGluZGV4IDcwOTlmZmEuLjY2NmVmZGQgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3N5c2Zz
LmMKPiA+ICsrKyBiL2ZzL2YyZnMvc3lzZnMuYwo+ID4gQEAgLTE0Myw2ICsxNDMsMzMgQEAgc3Rh
dGljIHNzaXplX3QgcGVuZGluZ19kaXNjYXJkX3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZTTV9JKHNiaSktPmRjY19pbmZvLT5kaXNj
YXJkX2NtZF9jbnQpKTsKPiA+ICAgfQo+ID4KPiA+ICtzdGF0aWMgc3NpemVfdCBpc3N1ZWRfZGlz
Y2FyZF9zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gPiArICAgICAgICAgICAgIHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwgY2hhciAqYnVmKQo+ID4gK3sKPiA+ICsgICAgIGlmICghU01fSShz
YmkpLT5kY2NfaW5mbykKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArICAg
ICByZXR1cm4gc3lzZnNfZW1pdChidWYsICIlbGx1XG4iLCAodW5zaWduZWQgbG9uZyBsb25nKWF0
b21pY19yZWFkKAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJlNNX0koc2JpKS0+
ZGNjX2luZm8tPmlzc3VlZF9kaXNjYXJkKSk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBzc2l6
ZV90IHF1ZXVlZF9kaXNjYXJkX3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPiA+ICsgICAgICAg
ICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBjaGFyICpidWYpCj4gPiArewo+ID4gKyAg
ICAgaWYgKCFTTV9JKHNiaSktPmRjY19pbmZvKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiA+ICsgICAgIHJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVsbHVcbiIsICh1bnNpZ25l
ZCBsb25nIGxvbmcpYXRvbWljX3JlYWQoCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmU01fSShzYmkpLT5kY2NfaW5mby0+cXVldWVkX2Rpc2NhcmQpKTsKPiA+ICt9Cj4gPiArCj4g
PiArc3RhdGljIHNzaXplX3QgdW5kaXNjYXJkX2Jsa3Nfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICph
LAo+ID4gKyAgICAgICAgICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGNoYXIgKmJ1ZikK
PiA+ICt7Cj4gPiArICAgICBpZiAoIVNNX0koc2JpKS0+ZGNjX2luZm8pCj4gPiArICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKyAgICAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJXVc
biIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTTV9JKHNiaSktPmRjY19pbmZv
LT51bmRpc2NhcmRfYmxrcyk7Cj4gPiArfQo+ID4gKwo+ID4gICBzdGF0aWMgc3NpemVfdCBnY19t
b2RlX3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPiA+ICAgICAgICAgICAgICAgc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCBjaGFyICpidWYpCj4gPiAgIHsKPiA+IEBAIC0xMDI1LDYgKzEwNTIs
OSBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3NiX2ZlYXR1cmVfc2hvdyhzdHJ1Y3QgZjJmc19hdHRy
ICphLAo+ID4gICBGMkZTX0dFTkVSQUxfUk9fQVRUUihtb3VudGVkX3RpbWVfc2VjKTsKPiA+ICAg
RjJGU19HRU5FUkFMX1JPX0FUVFIobWFpbl9ibGthZGRyKTsKPiA+ICAgRjJGU19HRU5FUkFMX1JP
X0FUVFIocGVuZGluZ19kaXNjYXJkKTsKPiA+ICtGMkZTX0dFTkVSQUxfUk9fQVRUUihpc3N1ZWRf
ZGlzY2FyZCk7Cj4gPiArRjJGU19HRU5FUkFMX1JPX0FUVFIocXVldWVkX2Rpc2NhcmQpOwo+ID4g
K0YyRlNfR0VORVJBTF9ST19BVFRSKHVuZGlzY2FyZF9ibGtzKTsKPiA+ICAgRjJGU19HRU5FUkFM
X1JPX0FUVFIoZ2NfbW9kZSk7Cj4gPiAgICNpZmRlZiBDT05GSUdfRjJGU19TVEFUX0ZTCj4gPiAg
IEYyRlNfR0VORVJBTF9ST19BVFRSKG1vdmVkX2Jsb2Nrc19iYWNrZ3JvdW5kKTsKPiA+IEBAIC0x
MDg0LDYgKzExMTQsOSBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3NiX2ZlYXR1cmVfc2hvdyhzdHJ1
Y3QgZjJmc19hdHRyICphLAo+ID4gICAgICAgQVRUUl9MSVNUKG1heF9vcmRlcmVkX2Rpc2NhcmQp
LAo+ID4gICAgICAgQVRUUl9MSVNUKGRpc2NhcmRfaW9fYXdhcmUpLAo+ID4gICAgICAgQVRUUl9M
SVNUKHBlbmRpbmdfZGlzY2FyZCksCj4gPiArICAgICBBVFRSX0xJU1QoaXNzdWVkX2Rpc2NhcmQp
LAo+ID4gKyAgICAgQVRUUl9MSVNUKHF1ZXVlZF9kaXNjYXJkKSwKPiA+ICsgICAgIEFUVFJfTElT
VCh1bmRpc2NhcmRfYmxrcyksCj4gPiAgICAgICBBVFRSX0xJU1QoZ2NfbW9kZSksCj4gPiAgICAg
ICBBVFRSX0xJU1QoaXB1X3BvbGljeSksCj4gPiAgICAgICBBVFRSX0xJU1QobWluX2lwdV91dGls
KSwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
