Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27621A742D6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Mar 2025 04:41:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ty0aa-0007xt-6o;
	Fri, 28 Mar 2025 03:41:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1ty0aY-0007xm-ON
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 03:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Fpk5q+DL6eSAjY7P9CU8lttSPAJR4QFVI3ljb4GX5I=; b=mewQQXeaXdDvfBAEfJ7iaWYVBr
 8yMx0I//kSwdt7SyjAQoKIu3qS/pF/RuMoB0DsrZObn+1iChozAm/ICfjAgwSyH8j7/lbdLtdm7/3
 reUlKJAMFqS2Ak3QHyi8qqrxJfJyOEFx1RTTdnpfzL85h3/DE216RlL0y9ZlH4C2Lt9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Fpk5q+DL6eSAjY7P9CU8lttSPAJR4QFVI3ljb4GX5I=; b=B11U3FZXh9pgHa31VVl1BSJHPt
 K2cGwPu/fT3Umozsdf5T+SgxqYpkXTNWmGKdUO6V/f+dtAd+ZH6X6CT7YwFQDNngNaaxrLtk14cgG
 CaIujRilwTZSFX9plvZaQPmzAvk4lGc+x/0gyWEo87/e2atRCyZVqbA2YJxsiCy++Z0I=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1ty0aW-0004L9-Kv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 03:40:59 +0000
X-AuditID: a67dfc59-057ff7000000aab6-1a-67e61a3bc9ce
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 28 Mar 2025 12:40:36 +0900
Message-ID: <20250328034042.2444-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <60e763d5-dff4-44a1-9e80-48d384335027@kernel.org>
References: <60e763d5-dff4-44a1-9e80-48d384335027@kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsXC9ZZnka611LN0g7OLVSxOTz3LZPHmyBkW
 iyfrZzFbfLl6jd3i0iJ3i8u75rA5sHnsnHWX3WPTqk42j90LPjN5fN4kF8ASxWWTkpqTWZZa
 pG+XwJXRtvw8W0GfXcWTg5eZGhiXGXQxcnJICJhIXHqwkBXGnv/nLTOIzSagIfGntxfMFhHQ
 kpjY8Jexi5GLg1lgHqPEp/0bmUEcYYHFjBK3bj5jAqliEVCVaDp+gBHE5hUwk9i26xELxFRN
 iR1fzoPVcArYSdx/PB0sLiRgK7Hr7j82iHpBiZMznwDFOYA2qEusnycEEmYWkJdo3jobbJeE
 wBI2ie4rL5khZkpKHFxxg2UCo8AsJO2zENpnIWlfwMi8ilEkM68sNzEzx1ivODujMi+zQi85
 P3cTIzCYl9X+idzB+O1C8CFGAQ5GJR7eA7ZP04VYE8uKK3MPMUpwMCuJ8EpeeZIuxJuSWFmV
 WpQfX1Sak1p8iFGag0VJnNfoW3mKkEB6YklqdmpqQWoRTJaJg1OqgXH6ruQoi2mb2X99btzN
 qOivyJ91OvzAlP37m9tKblrk3T9/knWe/vOsm5tLbbnFD62qujv55e7NbU1lPyMabuWoi23x
 rw7/23c+6Uzw7Ri7tdv5pt+VMqzdd1HxSDVrzJJF10+XmGw76fx1xq2pq00ki5b+mtf7NJL1
 htw0w4euCUbp4r0/PdOVWIozEg21mIuKEwFJj0oNYgIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsXCNUNljq611LN0g30fJC1OTz3LZPHmyBkW
 iyfrZzFbfLl6jd3i0iJ3i8u75rBZTJh7lcni/dZ7jA4cHjtn3WX32LSqk81j94LPTB7fbnt4
 fN4kF8AaxWWTkpqTWZZapG+XwJXRtvw8W0GfXcWTg5eZGhiXGXQxcnJICJhIzP/zlhnEZhPQ
 kPjT2wtmiwhoSUxs+MvYxcjFwSwwj1Hi0/6NzCCOsMBiRolbN58xgVSxCKhKNB0/wAhi8wqY
 SWzb9YgFYqqmxI4v58FqOAXsJO4/ng4WFxKwldh19x8bRL2gxMmZT4DiHEAb1CXWzxMCCTML
 yEs0b53NPIGRdxaSqlkIVbOQVC1gZF7FKJKZV5abmJljplecnVGZl1mhl5yfu4kRGJ7Lav9M
 2sH47bL7IUYBDkYlHt4Dtk/ThVgTy4orcw8xSnAwK4nwSl55ki7Em5JYWZValB9fVJqTWnyI
 UZqDRUmc1ys8NUFIID2xJDU7NbUgtQgmy8TBKdXAeKA4SrVjV/CpkjR9pmdPtpSneDIrq+V9
 5rKMPqJ22IBHj21lEI93b8EL/5tG4W4uGTZtwSKB4mvsP1xmDnpxIrmdXZwt87ZaStLF/Xe2
 rGzorZBnPK7IdPjEi/1Mwd0vLkyNMs24m+D5/M0KrdLbF2avOtZ7YYLdj3bOiNad0ze3v2mc
 emu2EktxRqKhFnNRcSIA+phMcUsCAAA=
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  > From: Chao Yu <chao@kernel.org> > Sent: Thursday, March
   27, 2025 10:48 PM > To: 정요한(JOUNG YOHAN) Mobile AE <yohan.joung@sk.com>;
    Yohan Joung > <jyh429@gmail.com>; jaegeuk@kernel.org; daeho43@g [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [166.125.252.90 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [166.125.252.90 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ty0aW-0004L9-Kv
Subject: Re: [f2fs-dev] [External Mail] Re: [External Mail] Re: [PATCH]
 f2fs: prevent the current section from being selected as a victim during
 garbage collection
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
Cc: jyh429@gmail.com, linux-kernel@vger.kernel.org, pilhyun.kim@sk.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gU2VudDogVGh1cnNkYXksIE1hcmNo
IDI3LCAyMDI1IDEwOjQ4IFBNCj4gVG86IOygleyalO2VnChKT1VORyBZT0hBTikgTW9iaWxlIEFF
IDx5b2hhbi5qb3VuZ0Bzay5jb20+OyBZb2hhbiBKb3VuZwo+IDxqeWg0MjlAZ21haWwuY29tPjsg
amFlZ2V1a0BrZXJuZWwub3JnOyBkYWVobzQzQGdtYWlsLmNvbQo+IENjOiBjaGFvQGtlcm5lbC5v
cmc7IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0OyBsaW51eC0KPiBrZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyDquYDtlYTtmIQoS0lNIFBJTEhZVU4pIE1vYmlsZSBBRSA8cGls
aHl1bi5raW1Ac2suY29tPgo+IFN1YmplY3Q6IFtFeHRlcm5hbCBNYWlsXSBSZTogW0V4dGVybmFs
IE1haWxdIFJlOiBbRXh0ZXJuYWwgTWFpbF0gUmU6Cj4gW1BBVENIXSBmMmZzOiBwcmV2ZW50IHRo
ZSBjdXJyZW50IHNlY3Rpb24gZnJvbSBiZWluZyBzZWxlY3RlZCBhcyBhIHZpY3RpbQo+IGR1cmlu
ZyBnYXJiYWdlIGNvbGxlY3Rpb24KPiAKPiBPbiAyMDI1LzMvMjcgMTY6MDAsIHlvaGFuLmpvdW5n
QHNrLmNvbSB3cm90ZToKPiA+PiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gPj4g
U2VudDogVGh1cnNkYXksIE1hcmNoIDI3LCAyMDI1IDQ6MzAgUE0KPiA+PiBUbzog7KCV7JqU7ZWc
KEpPVU5HIFlPSEFOKSBNb2JpbGUgQUUgPHlvaGFuLmpvdW5nQHNrLmNvbT47IFlvaGFuIEpvdW5n
Cj4gPj4gPGp5aDQyOUBnbWFpbC5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmc7IGRhZWhvNDNAZ21h
aWwuY29tCj4gPj4gQ2M6IGNoYW9Aa2VybmVsLm9yZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQ7IGxpbnV4LQo+ID4+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IOq5gO2V
hO2YhChLSU0gUElMSFlVTikgTW9iaWxlIEFFCj4gPj4gPHBpbGh5dW4ua2ltQHNrLmNvbT4KPiA+
PiBTdWJqZWN0OiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtFeHRlcm5hbCBNYWlsXSBSZTogW1BBVENI
XSBmMmZzOgo+ID4+IHByZXZlbnQgdGhlIGN1cnJlbnQgc2VjdGlvbiBmcm9tIGJlaW5nIHNlbGVj
dGVkIGFzIGEgdmljdGltIGR1cmluZwo+ID4+IGdhcmJhZ2UgY29sbGVjdGlvbgo+ID4+Cj4gPj4g
T24gMy8yNy8yNSAxNDo0MywgeW9oYW4uam91bmdAc2suY29tIHdyb3RlOgo+ID4+Pj4gRnJvbTog
Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+ID4+Pj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDI3
LCAyMDI1IDM6MDIgUE0KPiA+Pj4+IFRvOiBZb2hhbiBKb3VuZyA8anloNDI5QGdtYWlsLmNvbT47
IGphZWdldWtAa2VybmVsLm9yZzsKPiA+Pj4+IGRhZWhvNDNAZ21haWwuY29tCj4gPj4+PiBDYzog
Y2hhb0BrZXJuZWwub3JnOyBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsg
bGludXgtCj4gPj4+PiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyDsoJXsmpTtlZwoSk9VTkcgWU9I
QU4pIE1vYmlsZSBBRQo+ID4+Pj4gPHlvaGFuLmpvdW5nQHNrLmNvbT4KPiA+Pj4+IFN1YmplY3Q6
IFtFeHRlcm5hbCBNYWlsXSBSZTogW1BBVENIXSBmMmZzOiBwcmV2ZW50IHRoZSBjdXJyZW50Cj4g
Pj4+PiBzZWN0aW9uIGZyb20gYmVpbmcgc2VsZWN0ZWQgYXMgYSB2aWN0aW0gZHVyaW5nIGdhcmJh
Z2UgY29sbGVjdGlvbgo+ID4+Pj4KPiA+Pj4+IE9uIDMvMjYvMjUgMjI6MTQsIFlvaGFuIEpvdW5n
IHdyb3RlOgo+ID4+Pj4+IFdoZW4gc2VsZWN0aW5nIGEgdmljdGltIHVzaW5nIG5leHRfdmljdGlt
X3NlZyBpbiBhIGxhcmdlIHNlY3Rpb24sCj4gPj4+Pj4gdGhlIHNlbGVjdGVkIHNlY3Rpb24gbWln
aHQgYWxyZWFkeSBoYXZlIGJlZW4gY2xlYXJlZCBhbmQKPiA+Pj4+PiBkZXNpZ25hdGVkIGFzIHRo
ZSBuZXcgY3VycmVudCBzZWN0aW9uLCBtYWtpbmcgaXQgYWN0aXZlbHkgaW4gdXNlLgo+ID4+Pj4+
IFRoaXMgYmVoYXZpb3IgY2F1c2VzIGluY29uc2lzdGVuY3kgYmV0d2VlbiB0aGUgU0lUIGFuZCBT
U0EuCj4gPj4+Pgo+ID4+Pj4gSGksIGRvZXMgdGhpcyBmaXggeW91ciBpc3N1ZT8KPiA+Pj4KPiA+
Pj4gVGhpcyBpcyBhbiBpc3N1ZSB0aGF0IGFyaXNlcyB3aGVuIGRpdmlkaW5nIGEgbGFyZ2Ugc2Vj
dGlvbiBpbnRvCj4gPj4+IHNlZ21lbnRzIGZvciBnYXJiYWdlIGNvbGxlY3Rpb24uCj4gPj4+IGNh
dXNlZCBieSB0aGUgYmFja2dyb3VuZCBHQyAoZ2FyYmFnZSBjb2xsZWN0aW9uKSB0aHJlYWQgaW4g
bGFyZ2UKPiA+Pj4gc2VjdGlvbgo+ID4+PiBmMmZzX2djKHZpY3RpbV9zZWN0aW9uKSAtPgo+ID4+
PiBmMmZzX2NsZWFyX3ByZWZyZWVfc2VnbWVudHModmljdGltX3NlY3Rpb24pLT4KPiA+Pj4gY3Vy
c2VjKHZpY3RpbV9zZWN0aW9uKSAtPiBmMmZzX2djKHZpY3RpbV9zZWN0aW9uIGJ5IG5leHRfdmlj
dGltX3NlZykKPiA+Pgo+ID4+IEkgZGlkbid0IGdldCBpdCwgd2h5IGYyZnNfZ2V0X3ZpY3RpbSgp
IHdpbGwgcmV0dXJuIHNlY3Rpb24gd2hpY2ggaXMKPiA+PiB1c2VkIGJ5IGN1cnNlZz8gSXQgc2hv
dWxkIGJlIGF2b2lkZWQgYnkgY2hlY2tpbmcgdy8gc2VjX3VzYWdlX2NoZWNrKCkuCj4gPj4KPiA+
PiBPciB3ZSBtaXNzZWQgdG8gY2hlY2sgZ2Npbmcgc2VjdGlvbiB3aGljaCBuZXh0X3ZpY3RpbV9z
ZWcgcG9pbnRzIHRvCj4gPj4gZHVyaW5nIGdldF9uZXdfc2VnbWVudCgpPwo+ID4+Cj4gPj4gQ2Fu
IHRoaXMgaGFwcGVuPwo+ID4+Cj4gPj4gZS5nLgo+ID4+IC0gYmdnYyBzZWxlY3RzIHNlYyAjMAo+
ID4+IC0gbmV4dF92aWN0aW1fc2VnOiBzZWcgIzAKPiA+PiAtIG1pZ3JhdGUgc2VnICMwIGFuZCBz
dG9wCj4gPj4gLSBuZXh0X3ZpY3RpbV9zZWc6IHNlZyAjMQo+ID4+IC0gY2hlY2twb2ludCwgc2V0
IHNlYyAjMCBmcmVlIGlmIHNlYyAjMCBoYXMgbm8gdmFsaWQgYmxvY2tzCj4gPj4gLSBhbGxvY2F0
ZSBzZWcgIzAgaW4gc2VjICMwIGZvciBjdXJzZWcKPiA+PiAtIGN1cnNlZyBtb3ZlcyB0byBzZWcg
IzEgYWZ0ZXIgYWxsb2NhdGlvbgo+ID4+IC0gYmdnYyB0cmllcyB0byBtaWdyYXRlIHNlZyAjMQo+
ID4+Cj4gPj4gVGhhbmtzLAo+ID4gVGhhdCdzIGNvcnJlY3QKPiA+IEluIGYyZnNfZ2V0X3ZpY3Rp
bSwgd2UgdXNlIG5leHRfdmljdGltX3NlZyB0byBkaXJlY3RseSBqdW1wIHRvCj4gPiBnb3RfcmVz
dWx0LCB0aGVyZWJ5IGJ5cGFzc2luZyBzZWNfdXNhZ2VfY2hlY2sgV2hhdCBkbyB5b3UgdGhpbmsg
YWJvdXQKPiA+IHRoaXMgY2hhbmdlPwo+ID4KPiA+IEBAIC04NTAsMTUgKzg1MCwyMCBAQCBpbnQg
ZjJmc19nZXRfdmljdGltKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiB1bnNpZ25lZCBpbnQg
KnJlc3VsdCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBwLm1pbl9zZWdubyA9IHNiaS0+
bmV4dF92aWN0aW1fc2VnW0JHX0dDXTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAqcmVz
dWx0ID0gcC5taW5fc2Vnbm87Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5uZXh0
X3ZpY3RpbV9zZWdbQkdfR0NdID0gTlVMTF9TRUdOTzsKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gZ290X3Jlc3VsdDsKPiA+ICAgICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAg
ICAgICAgICBpZiAoZ2NfdHlwZSA9PSBGR19HQyAmJgo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdICE9IE5VTExfU0VHTk8pIHsK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBwLm1pbl9zZWdubyA9IHNiaS0+bmV4dF92aWN0
aW1fc2VnW0ZHX0dDXTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAqcmVzdWx0ID0gcC5t
aW5fc2Vnbm87Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5uZXh0X3ZpY3RpbV9z
ZWdbRkdfR0NdID0gTlVMTF9TRUdOTzsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
Z290X3Jlc3VsdDsKPiA+ICAgICAgICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAg
ICAgIHNlY25vID0gR0VUX1NFQ19GUk9NX1NFRyhzYmksIHNlZ25vKTsKPiA+ICsKPiA+ICsgICAg
ICAgICAgICAgICBpZiAoc2VjX3VzYWdlX2NoZWNrKHNiaSwgc2Vjbm8pKQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBuZXh0Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGdvdG8g
Z290X3Jlc3VsdDsKPiA+ICAgICAgICAgIH0KPiAKPiBCdXQgc3RpbGwgYWxsb2NhdG9yIGNhbiBh
c3NpZ24gdGhpcyBzZWdtZW50IGFmdGVyIHNlY191c2FnZV9jaGVjaygpIGluCj4gcmFjZSBjb25k
aXRpb24sIHJpZ2h0PwpTaW5jZSB0aGUgQkcgR0MgdXNpbmcgbmV4dF92aWN0aW0gIHRha2VzIHBs
YWNlIGFmdGVyIHRoZSBTSVQgdXBkYXRlIGluIGRvX2NoZWNrcG9pbnQsIAppdCBzZWVtcyB1bmxp
a2VseSB0aGF0IGEgcmFjZSBjb25kaXRpb24gd2l0aCBzZWNfdXNhZ2VfY2hlY2sgd2lsbCBvY2N1
ci4KPiAKPiBJTU8sIHdlIGNhbiBjbGVhciBuZXh0X3ZpY3RpbV9zZWdbXSBvbmNlIHNlY3Rpb24g
aXMgZnJlZSBpbgo+IF9fc2V0X3Rlc3RfYW5kX2ZyZWUoKT8gc29tZXRoaW5nIGxpa2UgdGhpczoK
SSB3aWxsIHRlc3QgaXQgYWNjb3JkaW5nIHRvIHlvdXIgc3VnZ2VzdGlvbi4KSWYgdGhlcmUgYXJl
IG5vIGlzc3VlcywgY2FuIEkgc3VibWl0IGl0IGFnYWluIHdpdGggdGhlIHBhdGNoPwpUaGFua3MK
PiAKPiAtLS0KPiAgIGZzL2YyZnMvc2VnbWVudC5oIHwgMTMgKysrKysrKysrKy0tLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5oIGIvZnMvZjJmcy9zZWdtZW50LmggaW5kZXgKPiAwNDY1
ZGMwMGIzNDkuLjgyNmUzNzk5OTA4NSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuaAo+
ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5oCj4gQEAgLTQ3Myw5ICs0NzMsMTYgQEAgc3RhdGljIGlu
bGluZSB2b2lkIF9fc2V0X3Rlc3RfYW5kX2ZyZWUoc3RydWN0Cj4gZjJmc19zYl9pbmZvICpzYmks
Cj4gICAJCQlnb3RvIHNraXBfZnJlZTsKPiAgIAkJbmV4dCA9IGZpbmRfbmV4dF9iaXQoZnJlZV9p
LT5mcmVlX3NlZ21hcCwKPiAgIAkJCQlzdGFydF9zZWdubyArIFNFR1NfUEVSX1NFQyhzYmkpLCBz
dGFydF9zZWdubyk7Cj4gLQkJaWYgKG5leHQgPj0gc3RhcnRfc2Vnbm8gKyB1c2FibGVfc2Vncykg
ewo+IC0JCQlpZiAodGVzdF9hbmRfY2xlYXJfYml0KHNlY25vLCBmcmVlX2ktPmZyZWVfc2VjbWFw
KSkKPiAtCQkJCWZyZWVfaS0+ZnJlZV9zZWN0aW9ucysrOwo+ICsJCWlmICgobmV4dCA+PSBzdGFy
dF9zZWdubyArIHVzYWJsZV9zZWdzKSAmJgo+ICsJCQl0ZXN0X2FuZF9jbGVhcl9iaXQoc2Vjbm8s
IGZyZWVfaS0+ZnJlZV9zZWNtYXApKSB7Cj4gKwkJCWZyZWVfaS0+ZnJlZV9zZWN0aW9ucysrOwo+
ICsKPiArCQkJaWYgKEdFVF9TRUNfRlJPTV9TRUcoc2JpLT5uZXh0X3ZpY3RpbV9zZWdbQkdfR0Nd
KSA9PQo+ICsJCQkJCQkJCQlzZWNubykKPiArCQkJCXNiaS0+bmV4dF92aWN0aW1fc2VnW0JHX0dD
XSA9IE5VTExfU0VHTk87Cj4gKwkJCWlmIChHRVRfU0VDX0ZST01fU0VHKHNiaS0+bmV4dF92aWN0
aW1fc2VnW0ZHX0dDXSkgPT0KPiArCQkJCQkJCQkJc2Vjbm8pCj4gKwkJCQlzYmktPm5leHRfdmlj
dGltX3NlZ1tGR19HQ10gPSBOVUxMX1NFR05POwo+ICAgCQl9Cj4gICAJfQo+ICAgc2tpcF9mcmVl
Ogo+IC0tCj4gMi40MC4xCj4gCj4gPj4KPiA+Pj4KPiA+Pj4gQmVjYXVzZSB0aGUgY2FsbCBzdGFj
ayBpcyBkaWZmZXJlbnQsIEkgdGhpbmsgdGhhdCBpbiBvcmRlciB0byBoYW5kbGUKPiA+Pj4gZXZl
cnl0aGluZyBhdCBvbmNlLCB3ZSBuZWVkIHRvIGFkZHJlc3MgaXQgd2l0aGluIGRvX2dhcmJhZ2Vf
Y29sbGVjdCwKPiA+Pj4gb3Igb3RoZXJ3aXNlIGluY2x1ZGUgaXQgb24gYm90aCBzaWRlcy4KPiA+
Pj4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gPj4+Cj4gPj4+IFszMDE0Ni4zMzc0NzFdWyBUMTMwMF0g
RjJGUy1mcyAoZG0tNTQpOiBJbmNvbnNpc3RlbnQgc2VnbWVudCAoNzA5NjEpCj4gPj4+IHR5cGUg
WzAsIDFdIGluIFNTQSBhbmQgU0lUIFszMDE0Ni4zNDYxNTFdWyBUMTMwMF0gQ2FsbCB0cmFjZToK
PiA+Pj4gWzMwMTQ2LjM0NjE1Ml1bIFQxMzAwXSAgZHVtcF9iYWNrdHJhY2UrMHhlOC8weDEwYyBb
MzAxNDYuMzQ2MTU3XVsKPiA+Pj4gVDEzMDBdICBzaG93X3N0YWNrKzB4MTgvMHgyOCBbMzAxNDYu
MzQ2MTU4XVsgVDEzMDBdCj4gPj4+IGR1bXBfc3RhY2tfbHZsKzB4NTAvMHg2YyBbMzAxNDYuMzQ2
MTYxXVsgVDEzMDBdCj4gPj4+IGR1bXBfc3RhY2srMHgxOC8weDI4IFszMDE0Ni4zNDYxNjJdWyBU
MTMwMF0KPiA+Pj4gZjJmc19zdG9wX2NoZWNrcG9pbnQrMHgxYy8weDNjIFszMDE0Ni4zNDYxNjVd
WyBUMTMwMF0KPiA+Pj4gZG9fZ2FyYmFnZV9jb2xsZWN0KzB4NDFjLzB4MjcxYyBbMzAxNDYuMzQ2
MTY3XVsgVDEzMDBdCj4gPj4+IGYyZnNfZ2MrMHgyN2MvMHg4MjggWzMwMTQ2LjM0NjE2OF1bIFQx
MzAwXQo+ID4+PiBnY190aHJlYWRfZnVuYysweDI5MC8weDg4YyBbMzAxNDYuMzQ2MTY5XVsgVDEz
MDBdCj4gPj4+IGt0aHJlYWQrMHgxMWMvMHgxNjQgWzMwMTQ2LjM0NjE3Ml1bIFQxMzAwXQo+ID4+
PiByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMAo+ID4+Pgo+ID4+PiBzdHJ1Y3QgY3Vyc2VnX2luZm8g
OiAweGZmZmZmZjgwM2Y5NWU4MDAgewo+ID4+PiAJc2Vnbm8gICAgICAgIDogMHgxMTUzMSA6IDcw
OTYxCj4gPj4+IH0KPiA+Pj4KPiA+Pj4gc3RydWN0IGYyZnNfc2JfaW5mbyA6IDB4ZmZmZmZmODgx
MWQxMjAwMCB7Cj4gPj4+IAluZXh0X3ZpY3RpbV9zZWdbMF0gOiAweDExNTMxIDogNzA5NjEgfQo+
ID4+Pgo+ID4+Pj4KPiA+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2
ZWwvMjAyNTAzMjUwODA2NDYuMzI5MTk0Ny0yLQo+ID4+Pj4gY2hhb0BrZXJuZWwub3JnCj4gPj4+
Pgo+ID4+Pj4gVGhhbmtzLAo+ID4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFlv
aGFuIEpvdW5nIDx5b2hhbi5qb3VuZ0Bzay5jb20+Cj4gPj4+Pj4gLS0tCj4gPj4+Pj4gICBmcy9m
MmZzL2djLmMgfCA0ICsrKysKPiA+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKPiA+Pj4+Pgo+ID4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZzL2dj
LmMgaW5kZXgKPiA+Pj4+PiAyYjhmOTIzOWJlZGUuLjRiNWQxOGUzOTVlYiAxMDA2NDQKPiA+Pj4+
PiAtLS0gYS9mcy9mMmZzL2djLmMKPiA+Pj4+PiArKysgYi9mcy9mMmZzL2djLmMKPiA+Pj4+PiBA
QCAtMTkyNiw2ICsxOTI2LDEwIEBAIGludCBmMmZzX2djKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwKPiA+Pj4+PiBzdHJ1Y3QKPiA+Pj4+IGYyZnNfZ2NfY29udHJvbCAqZ2NfY29udHJvbCkKPiA+
Pj4+PiAgIAkJZ290byBzdG9wOwo+ID4+Pj4+ICAgCX0KPiA+Pj4+Pgo+ID4+Pj4+ICsJaWYgKF9f
aXNfbGFyZ2Vfc2VjdGlvbihzYmkpICYmCj4gPj4+Pj4gKwkJCUlTX0NVUlNFQyhzYmksIEdFVF9T
RUNfRlJPTV9TRUcoc2JpLCBzZWdubykpKQo+ID4+Pj4+ICsJCWdvdG8gc3RvcDsKPiA+Pj4+PiAr
Cj4gPj4+Pj4gICAJc2VnX2ZyZWVkID0gZG9fZ2FyYmFnZV9jb2xsZWN0KHNiaSwgc2Vnbm8sICZn
Y19saXN0LCBnY190eXBlLAo+ID4+Pj4+ICAgCQkJCWdjX2NvbnRyb2wtPnNob3VsZF9taWdyYXRl
X2Jsb2NrcywKPiA+Pj4+PiAgIAkJCQlnY19jb250cm9sLT5vbmVfdGltZSk7Cj4gPj4+Cj4gPgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
