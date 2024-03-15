Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0432E87C7F5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Mar 2024 04:30:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkyH4-0004gJ-AV;
	Fri, 15 Mar 2024 03:30:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rkyH3-0004gC-J5
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Mar 2024 03:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1BOadd8fpWw24fQ+dpN551w2EzZFhXi8Nm7Mn+u1K9E=; b=b3JRfZMX9xkZXzDlnSRsC+KKVo
 BvRPFMHcQL1vrWs81RJPjmW2Bxg6qbifJFUXWUKJDZ+/3IWQFhiucbaDyHRh91d1rhkgmKOtPGV8c
 YUuV+PHCtgV6Y90ETH8wWS9xeBGNwHiJTGTNjAPi84nQ7k6W3//cbXDRXMbhntRt9Wuw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1BOadd8fpWw24fQ+dpN551w2EzZFhXi8Nm7Mn+u1K9E=; b=V4gbyGr8e1IllX3amkTEFFT5WO
 BB1SKyZYhHyMxEwDvApbnHF493hh/tIZa9k0VNy1yz5G9vEkG4K2ZdlAEEeUNNguhFnXqmN9EZMiz
 +lZ7dM05GZdTi++4/9pXDiWeqqwk97e0W//txcM+542Qo1QrYacCSal+Z0qC2XgDvq+E=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rkyGs-0007et-0B for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Mar 2024 03:30:25 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5684073ab38so3024611a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Mar 2024 20:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710473409; x=1711078209; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1BOadd8fpWw24fQ+dpN551w2EzZFhXi8Nm7Mn+u1K9E=;
 b=JzRvgaoK18ZcrkKm667dLMdlXEke+sZGNWr7iu7XCCml5ukypUSvOxz+yZM2flVO1w
 T6jVSZC3s8Nkt1GL1aY/Bgv1P7pe2TIaARFNkXTzKmoLjS0wPovaToPD5o0gFv9oizRo
 Ki9vBtxgoRqXz4owM9SooJ/wcVL2KdYKNzfBDPGaBMsVBcL/+QjdR0oKbdsYEZ2K4ajX
 msE4PazjJuS9zeHqoS2zTLv2a9iJCdcvJl+kwfZHUyMbzB6rWry/iCwnHabLoPmx4Pth
 /1UkEzWttZCE8ORh7Y8xYFAVL/t2dKlIkU4D2+47YwdgkTGsubFQHOJkhMYzffKb2Hka
 4acA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710473409; x=1711078209;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1BOadd8fpWw24fQ+dpN551w2EzZFhXi8Nm7Mn+u1K9E=;
 b=IaEvXDCRJM76w0fESMUs3EpBtNpkjThzimFbvKTlnEAXs451HFiT+cYJ9RIz/dOeG+
 MzTMySVwy7YVJoGN9ukHx2S77go1Kyts2EqTiQoMPVUGeVPCDWloBX/KxBzlVEP07iqd
 HKFPL4BPTJa7V2dXtPy2cBcjCPxKfv40lfgkoIRb+BCxrmDwtKmKnk+d5Xl+hr7cMal8
 SqErg641VctB+2ouqeteH5Vj1F/qDJBx1ZE327EXSjF3m2PSoLD4oa76i0T2pJjUiYdH
 zTEzubKFZ7js/1+MQjSnXwBCPCKOXug4HYps35liXWtc33BhPf/cqX5ypUpQEZMkShTs
 Ds2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUElCpw/h5UTz07nFlYMvvgI/x3A2rRWTTHTiBnkwlXJmASK3Y/fzDHjuRK+wkv3AtZTVJXIuzdb6q5YZPIIB8cecFxpeWDdynlELnjRveqEzm4CYAI4Q==
X-Gm-Message-State: AOJu0Ywj/j0GzOlORxkZ0Gz3y6sHaq3s+NSOUgaRzQvfykRPRMo0vCj9
 x7RRMOIWfYMXjasX3frzm4Nzk51QwpND8N0XDlCX2PLkuQDp8UspcgSPk4VTgXSX37emDSV6T1N
 mlbu01IMTJzsj+dQtD9B2Zlwl19VXh6vMUYQ=
X-Google-Smtp-Source: AGHT+IFHS54SpNnKDt8mMe8ILXy8AdWC+kJxpK+jqfEnDEG8oDs47GBlV2v66U6GBTE2BnGOw7XsLILNfzyUDgTPRfg=
X-Received: by 2002:a05:6402:248b:b0:567:1947:d53f with SMTP id
 q11-20020a056402248b00b005671947d53fmr4327514eda.9.1710473408989; Thu, 14 Mar
 2024 20:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <1710303061-16822-1-git-send-email-zhiguo.niu@unisoc.com>
 <eeefebcb-54db-4087-9319-dd5f9b63a1da@kernel.org>
 <CAHJ8P3+mo+yT8wfv2Xd3Rb7sFtXufmOgh_6CLzZxM5CjtYWC2Q@mail.gmail.com>
 <2f52570e-da77-40f3-a886-2ee76059fc6b@kernel.org>
In-Reply-To: <2f52570e-da77-40f3-a886-2ee76059fc6b@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 15 Mar 2024 11:29:57 +0800
Message-ID: <CAHJ8P3J=RsQikjMpEEO_nw5cMdp1kYKerMOdp=wGbhC5bi+Dfg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Mar 15, 2024 at 11:07 AM Chao Yu wrote: > > On 2024/3/15
    9:46, Zhiguo Niu wrote: > > On Thu, Mar 14, 2024 at 9:06 PM Chao Yu wrote:
    > >> > >> On 2024/3/13 12:11, Zhiguo Niu wrote: > >> [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkyGs-0007et-0B
Subject: Re: [f2fs-dev] [PATCH] f2fs: add REQ_TIME time update for some user
 behaviors
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
 Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBNYXIgMTUsIDIwMjQgYXQgMTE6MDfigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gMjAyNC8zLzE1IDk6NDYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBP
biBUaHUsIE1hciAxNCwgMjAyNCBhdCA5OjA24oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Pgo+ID4+IE9uIDIwMjQvMy8xMyAxMjoxMSwgWmhpZ3VvIE5pdSB3cm90ZToK
PiA+Pj4gc29tZSB1c2VyIGJlaGF2aW9ycyByZXF1ZXN0ZWQgZmlsZXN5c3RlbSBvcGVyYXRpb25z
LCB3aGljaAo+ID4+PiB3aWxsIGNhdXNlIGZpbGVzeXN0ZW0gbm90IGlkbGUuCj4gPj4+IE1lYW53
aGlsZSBhZGp1c3QgZjJmc191cGRhdGVfdGltZShSRVFfVElNRSkgb2YKPiA+Pj4gZjJmc19pb2Nf
ZGVmcmFnbWVudCB0byBzdWNjZXNzZnVsIGNhc2UuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6
IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAgIGZz
L2YyZnMvZmlsZS5jIHwgOSArKysrKysrKy0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4+PiBpbmRleCA0ZGZlMzhlLi5kYWMzODM2IDEw
MDY0NAo+ID4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ID4+PiArKysgYi9mcy9mMmZzL2ZpbGUu
Ywo+ID4+PiBAQCAtMjc4NCw3ICsyNzg0LDYgQEAgc3RhdGljIGludCBmMmZzX2lvY19kZWZyYWdt
ZW50KHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPiA+Pj4gICAgICAgIGVy
ciA9IGYyZnNfZGVmcmFnbWVudF9yYW5nZShzYmksIGZpbHAsICZyYW5nZSk7Cj4gPj4+ICAgICAg
ICBtbnRfZHJvcF93cml0ZV9maWxlKGZpbHApOwo+ID4+Pgo+ID4+PiAtICAgICBmMmZzX3VwZGF0
ZV90aW1lKHNiaSwgUkVRX1RJTUUpOwo+ID4+Cj4gPj4gSSBndWVzcyB3ZSBuZWVkIHRvIGNhbGwg
ZjJmc191cGRhdGVfdGltZSgpIGhlcmUgaWYgYW55IGRhdGEgd2FzCj4gPj4gbWlncmF0ZWQuCj4g
PiBPSyEKPiA+Pgo+ID4+IGlmIChyYW5nZS0+bGVuKQo+ID4+ICAgICAgICAgIGYyZnNfdXBkYXRl
X3RpbWUoc2JpLCBSRVFfVElNRSk7Cj4gPj4KPiA+Pj4gICAgICAgIGlmIChlcnIgPCAwKQo+ID4+
PiAgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ID4+Pgo+ID4+PiBAQCAtMjc5Miw2ICsyNzkx
LDcgQEAgc3RhdGljIGludCBmMmZzX2lvY19kZWZyYWdtZW50KHN0cnVjdCBmaWxlICpmaWxwLCB1
bnNpZ25lZCBsb25nIGFyZykKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihyYW5nZSkpKQo+ID4+PiAgICAgICAgICAgICAg
ICByZXR1cm4gLUVGQVVMVDsKPiA+Pj4KPiA+Pj4gKyAgICAgZjJmc191cGRhdGVfdGltZShzYmks
IFJFUV9USU1FKTsKPiA+Pj4gICAgICAgIHJldHVybiAwOwo+ID4+PiAgICB9Cj4gPj4+Cj4gPj4+
IEBAIC0zMzMxLDYgKzMzMzEsNyBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX3Jlc2l6ZV9mcyhzdHJ1
Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gPj4+ICAgICAgICBpZiAoY29weV9m
cm9tX3VzZXIoJmJsb2NrX2NvdW50LCAodm9pZCBfX3VzZXIgKilhcmcsCj4gPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2l6ZW9mKGJsb2NrX2NvdW50KSkpCj4gPj4+ICAgICAgICAgICAg
ICAgIHJldHVybiAtRUZBVUxUOwo+ID4+PiArICAgICBmMmZzX3VwZGF0ZV90aW1lKHNiaSwgUkVR
X1RJTUUpOwo+ID4+Cj4gPj4gVGhlcmUgd2lsbCBiZSBubyBmdXJ0aGVyIElPIGluIHRoZSBlbmQg
b2YgZjJmc19pb2NfcmVzaXplX2ZzKCksIHNvIHdlIGRvbid0Cj4gPj4gbmVlZCB0byB1cGRhdGUg
dGltZSB0byBkZWxheSBnYy9kaXNjYXJkIHRocmVhZD8KPiA+Pgo+ID4+Pgo+ID4+PiAgICAgICAg
cmV0dXJuIGYyZnNfcmVzaXplX2ZzKGZpbHAsIGJsb2NrX2NvdW50KTsKPiA+Pj4gICAgfQo+ID4+
PiBAQCAtMzQyNCw2ICszNDI1LDcgQEAgc3RhdGljIGludCBmMmZzX2lvY19zZXRmc2xhYmVsKHN0
cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPiA+Pj4gICAgICAgIGYyZnNfdXBf
d3JpdGUoJnNiaS0+c2JfbG9jayk7Cj4gPj4+Cj4gPj4+ICAgICAgICBtbnRfZHJvcF93cml0ZV9m
aWxlKGZpbHApOwo+ID4+PiArICAgICBmMmZzX3VwZGF0ZV90aW1lKHNiaSwgUkVRX1RJTUUpOwo+
ID4+Cj4gPj4gRGl0dG8sCj4gPiBEZWFyIENoYW8sCj4gPgo+ID4gVGhlIHR3byBwYXJ0cyB5b3Ug
cHJvcG9zZWQgc2hvdWxkIGJlIHNpbWlsYXIgdG8gdGhlIGJlbG93IHNjZW5hcmlvPwo+ID4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
PiBzdGF0aWMgaW50IGYyZnNfaW9jX3NldF9lbmNyeXB0aW9uX3BvbGljeShzdHJ1Y3QgZmlsZSAq
ZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gPiB7Cj4gPiBzdHJ1Y3QgaW5vZGUgKmlub2RlID0g
ZmlsZV9pbm9kZShmaWxwKTsKPiA+Cj4gPiBpZiAoIWYyZnNfc2JfaGFzX2VuY3J5cHQoRjJGU19J
X1NCKGlub2RlKSkpCj4gPiByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPgo+ID4gZjJmc191cGRhdGVf
dGltZShGMkZTX0lfU0IoaW5vZGUpLCBSRVFfVElNRSk7Cj4gPgo+ID4gcmV0dXJuIGZzY3J5cHRf
aW9jdGxfc2V0X3BvbGljeShmaWxwLCAoY29uc3Qgdm9pZCBfX3VzZXIgKilhcmcpOwo+Cj4gZnNj
cnlwdF9pb2N0bF9zZXRfcG9saWN5KCkgd2lsbCBkaXJ0eSBpbm9kZSwgc28gd2UgbmVlZCB0byBr
ZWVwCj4gZjJmc191cGRhdGVfdGltZSgpLCBidXQgaXQncyBiZXR0ZXIgdG8gdXBkYXRlIHRpbWUg
YWZ0ZXIKPiBmc2NyeXB0X2lvY3RsX3NldF9wb2xpY3koKT8KPgo+IFRoYW5rcywKRGVhciBDaGFv
LAphZ3JlZSBhbGwgeW91ciBzdWdnZXN0aW9ucy4gdGhhbmtzIGEgbG90Lgo+Cj4gPiB9Cj4gPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ID4gdGhhbmtzIQo+ID4KPiA+Cj4gPj4KPiA+PiBUaGFua3MsCj4gPj4KPiA+Pj4gICAgb3V0
Ogo+ID4+PiAgICAgICAga2ZyZWUodmJ1Zik7Cj4gPj4+ICAgICAgICByZXR1cm4gZXJyOwo+ID4+
PiBAQCAtMzU5Nyw2ICszNTk5LDcgQEAgc3RhdGljIGludCBmMmZzX3JlbGVhc2VfY29tcHJlc3Nf
YmxvY2tzKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPiA+Pj4KPiA+Pj4g
ICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV91bmxvY2soaW5vZGUtPmlfbWFwcGluZyk7Cj4gPj4+
ICAgICAgICBmMmZzX3VwX3dyaXRlKCZGMkZTX0koaW5vZGUpLT5pX2djX3J3c2VtW1dSSVRFXSk7
Cj4gPj4+ICsgICAgIGYyZnNfdXBkYXRlX3RpbWUoc2JpLCBSRVFfVElNRSk7Cj4gPj4+ICAgIG91
dDoKPiA+Pj4gICAgICAgIGlub2RlX3VubG9jayhpbm9kZSk7Cj4gPj4+Cj4gPj4+IEBAIC0zNzY2
LDYgKzM3NjksNyBAQCBzdGF0aWMgaW50IGYyZnNfcmVzZXJ2ZV9jb21wcmVzc19ibG9ja3Moc3Ry
dWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4+PiAgICAgICAgICAgICAgICBj
bGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9DT01QUkVTU19SRUxFQVNFRCk7Cj4gPj4+ICAgICAg
ICAgICAgICAgIGlub2RlX3NldF9jdGltZV9jdXJyZW50KGlub2RlKTsKPiA+Pj4gICAgICAgICAg
ICAgICAgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+ID4+PiArICAg
ICAgICAgICAgIGYyZnNfdXBkYXRlX3RpbWUoc2JpLCBSRVFfVElNRSk7Cj4gPj4+ICAgICAgICB9
Cj4gPj4+ICAgIHVubG9ja19pbm9kZToKPiA+Pj4gICAgICAgIGlub2RlX3VubG9jayhpbm9kZSk7
Cj4gPj4+IEBAIC0zOTY0LDYgKzM5NjgsNyBAQCBzdGF0aWMgaW50IGYyZnNfc2VjX3RyaW1fZmls
ZShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gPj4+ICAgICAgICBpZiAo
bGVuKQo+ID4+PiAgICAgICAgICAgICAgICByZXQgPSBmMmZzX3NlY3VyZV9lcmFzZShwcmV2X2Jk
ZXYsIGlub2RlLCBwcmV2X2luZGV4LAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcHJldl9ibG9jaywgbGVuLCByYW5nZS5mbGFncyk7Cj4gPj4+ICsgICAgIGYyZnNfdXBkYXRl
X3RpbWUoc2JpLCBSRVFfVElNRSk7Cj4gPj4+ICAgIG91dDoKPiA+Pj4gICAgICAgIGZpbGVtYXBf
aW52YWxpZGF0ZV91bmxvY2sobWFwcGluZyk7Cj4gPj4+ICAgICAgICBmMmZzX3VwX3dyaXRlKCZG
MkZTX0koaW5vZGUpLT5pX2djX3J3c2VtW1dSSVRFXSk7Cj4gPj4+IEBAIC00MTczLDYgKzQxNzgs
NyBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX2RlY29tcHJlc3NfZmlsZShzdHJ1Y3QgZmlsZSAqZmls
cCkKPiA+Pj4gICAgICAgIGlmIChyZXQpCj4gPj4+ICAgICAgICAgICAgICAgIGYyZnNfd2Fybihz
YmksICIlczogVGhlIGZpbGUgbWlnaHQgYmUgcGFydGlhbGx5IGRlY29tcHJlc3NlZCAoZXJybm89
JWQpLiBQbGVhc2UgZGVsZXRlIHRoZSBmaWxlLiIsCj4gPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBfX2Z1bmNfXywgcmV0KTsKPiA+Pj4gKyAgICAgZjJmc191cGRhdGVfdGltZShzYmksIFJF
UV9USU1FKTsKPiA+Pj4gICAgb3V0Ogo+ID4+PiAgICAgICAgaW5vZGVfdW5sb2NrKGlub2RlKTsK
PiA+Pj4gICAgICAgIGZpbGVfZW5kX3dyaXRlKGZpbHApOwo+ID4+PiBAQCAtNDI1Miw2ICs0MjU4
LDcgQEAgc3RhdGljIGludCBmMmZzX2lvY19jb21wcmVzc19maWxlKHN0cnVjdCBmaWxlICpmaWxw
KQo+ID4+PiAgICAgICAgaWYgKHJldCkKPiA+Pj4gICAgICAgICAgICAgICAgZjJmc193YXJuKHNi
aSwgIiVzOiBUaGUgZmlsZSBtaWdodCBiZSBwYXJ0aWFsbHkgY29tcHJlc3NlZCAoZXJybm89JWQp
LiBQbGVhc2UgZGVsZXRlIHRoZSBmaWxlLiIsCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBfX2Z1bmNfXywgcmV0KTsKPiA+Pj4gKyAgICAgZjJmc191cGRhdGVfdGltZShzYmksIFJFUV9U
SU1FKTsKPiA+Pj4gICAgb3V0Ogo+ID4+PiAgICAgICAgaW5vZGVfdW5sb2NrKGlub2RlKTsKPiA+
Pj4gICAgICAgIGZpbGVfZW5kX3dyaXRlKGZpbHApOwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
