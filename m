Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC0953E33
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2024 02:18:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sekfV-000797-KY;
	Fri, 16 Aug 2024 00:18:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1sekfT-00078t-J2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 00:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oZq7+8Jey8nXoq/5fEm7s6H29csgMZEGH1l/2dFmk+k=; b=DjAMI+R2UNZNl6b+PR8EN7SfLW
 ANwr68ws62Zrd/Q1d9aghqItHj4gPj5hinhdHiX4GJaR0C0IsrIu5pxhumBwCDqr09OxoteWuTn+D
 w8QWx4jaoS3qkHG6B0D7tZoSkR10FmTrWK8rcw9NHKp2NC8u3VYymtIKCEvL2/1lJIdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oZq7+8Jey8nXoq/5fEm7s6H29csgMZEGH1l/2dFmk+k=; b=X8KE9/i6P69L4mIYK5oWTDe5N0
 UlWzHx+I0mkTejoAbfkyi9BWaJOWCpvBrWJ611gVZdYFSGzxt/XVYvo6aW1KjnYaQ/lbqjmPNV+Nx
 pl75b8nGf8GONQJ+Ls1bz+B3HXUbWA3p8LnKhEQ/1wBGYTiT0VbKAkAfrvojHmyRhmPo=;
Received: from [203.254.224.33] (helo=mailout3.samsung.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sekfS-0002mn-0d for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 00:18:11 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240816001803epoutp030756719a47acdc853703aa7584490b10~sDWSdfJYL0114401144epoutp03D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Aug 2024 00:18:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240816001803epoutp030756719a47acdc853703aa7584490b10~sDWSdfJYL0114401144epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1723767483;
 bh=oZq7+8Jey8nXoq/5fEm7s6H29csgMZEGH1l/2dFmk+k=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=fdsqe35zK1E6gAP1FTSLGlJEys8hQyFpAznqUQc5X+G2N/bVianA/ohgo60hI57wM
 WRLSIIKKzL7e7Ml3uto8AV1mYf6EYOfAq1w3SpOFe/xI5L2LyWYUnvaRHDJ28hG668
 JYBMD2ItivP+AJc5X3h9I413eMOLi9sYT7sdqrkE=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20240816001802epcas2p2e105e0671748fd6df00ed28d8277046d~sDWRZCAnc2715127151epcas2p2L;
 Fri, 16 Aug 2024 00:18:02 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.91]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4WlMyd2vPwz4x9QG; Fri, 16 Aug
 2024 00:18:01 +0000 (GMT)
X-AuditID: b6c32a43-a0fff700000022c5-80-66be9ab88a71
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 A2.21.08901.8BA9EB66; Fri, 16 Aug 2024 09:18:01 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <7860b050-3948-4e23-b40f-a3df522477cd@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240816001700epcms2p37f406e9cd3a1d6438a866e7a7a3d5c31@epcms2p3>
Date: Fri, 16 Aug 2024 09:17:00 +0900
X-CMS-MailID: 20240816001700epcms2p37f406e9cd3a1d6438a866e7a7a3d5c31
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFJsWRmVeSWpSXmKPExsWy7bCmme7OWfvSDGYsZbY4PfUsk8XLQ5oW
 qx6EW/w4aWLRv7udxeLJ+lnMFve3XmO0uLTI3eLyrjlsFi1/nCzOT3zNZLGqYy6jxdTzR5gc
 eD02repk89i94DOTR9+WVYwenzfJBbBEZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoa
 WlqYKynkJeam2iq5+AToumXmAJ2mpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkw
 L9ArTswtLs1L18tLLbEyNDAwMgUqTMjO6L91hqXgnlrFzFPNLA2Mt1S7GDk5JARMJN49amDp
 YuTiEBLYwShxcOVJxi5GDg5eAUGJvzuEQWqEBbwlzr/uYgGxhQSUJNZfnMUOEdeTuPVwDSOI
 zSagIzH9xH12kDkiAg8YJabc2MsGkmAW2Msk0bS8DGIZr8SM9qcsELa0xPblW8GaOQXsJK6+
 eMUMEdeQ+LGsF8oWlbi5+i07jP3+2HxGCFtEovXeWagaQYkHP3dDxSUlbs/dBFWfL/H/ynIo
 u0Zi24F5ULa+xLWOjWA38Ar4Sqzuuwc2h0VAVaJtxw82iBoXie5pq1kh7teWWLbwNTMoTJgF
 NCXW79IHMSUElCWO3GKBqOCT6Dj8lx3mw4aNv7Gyd8x7wgRhq0ms+7meaQKj8ixEQM9CsmsW
 wq4FjMyrGMVSC4pz01OTjQoM4XGbnJ+7iRGcSLWcdzBemf9P7xAjEwfjIUYJDmYlEd6nX/am
 CfGmJFZWpRblxxeV5qQWH2I0BfpyIrOUaHI+MJXnlcQbmlgamJiZGZobmRqYK4nz3mudmyIk
 kJ5YkpqdmlqQWgTTx8TBKdXAVLwmYf6Gun3OjKIJHHV1E6fqf3ojby6dnj/71ITvOVePLAvb
 Wn+BvyJ/WZlO5c+bbld6unT1tz1iVtt3yTf+qFTqA2/P/H1rbkRf8TL/P1fcZ76tdPn8ORtZ
 mY+Uf2zrL/VJ/VK4IGiBubP0JqdZZzpuKV75eEUjUdj7aHjO22vs558YXWux+fD/yTLRVY1p
 2WdXmG1esPVOc9JjvdXL9H+cizgVfvfCHd+Jx7QPFiybcjuazzBqXYfLYyZPQUWNtcH9X99J
 pLnqfNj54okH7zOzCUc8L9kfELVYmvNUdEHDK1U3KWmDRT4XL3N/nsXw7Uj3ckvPU0vDgrpW
 t8mHrV4z52Ynp+HUWCX+vN7sMCWW4oxEQy3mouJEAPGhE5stBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b
References: <7860b050-3948-4e23-b40f-a3df522477cd@kernel.org>
 <20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b@epcms2p7>
 <CGME20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b@epcms2p3>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Chao Yu, >  >--------- Original Message --------- >Sender
    : Chao Yu <chao@kernel.org> >Date : 2024-08-14 18:50 (GMT+9) >Title : Re:
    [PATCH] f2fs: avoid unused block when dio write in LFS mode >  [...] 
 
 Content analysis details:   (0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [203.254.224.33 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [203.254.224.33 listed in bl.score.senderscore.com]
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: samsung.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [203.254.224.33 listed in wl.mailspike.net]
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sekfS-0002mn-0d
Subject: Re: [f2fs-dev] (2) [PATCH] f2fs: avoid unused block when dio write
 in LFS mode
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
Reply-To: daejun7.park@samsung.com
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Jeuk Kim <jeuk20.kim@samsung.com>,
 Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbyBZdSwKPsKgDQo+LS0tLS0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0tLS0tDQo+
U2VuZGVyIDogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPg0KPkRhdGUgOiAyMDI0LTA4LTE0IDE4
OjUwIChHTVQrOSkNCj5UaXRsZSA6IFJlOiBbUEFUQ0hdIGYyZnM6IGF2b2lkIHVudXNlZCBibG9j
ayB3aGVuIGRpbyB3cml0ZSBpbiBMRlMgbW9kZQ0KPsKgDQo+T24gMjAyNC84LzEgMTU6NDcsIERh
ZWp1biBQYXJrIHdyb3RlOg0KPj4gVGhpcyBwYXRjaCBhZGRyZXNzZXMgdGhlIHByb2JsZW0gdGhh
dCB3aGVuIHVzaW5nIExGUyBtb2RlLCB1bnVzZWQgYmxvY2tzDQo+PiBtYXkgb2NjdXIgaW4gZjJm
c19tYXBfYmxvY2tzKCkgZHVyaW5nIGJsb2NrIGFsbG9jYXRpb24gZm9yIGRpbyB3cml0ZXMuDQo+
Pg0KPj4gSWYgYSBuZXcgc2VjdGlvbiBpcyBhbGxvY2F0ZWQgZHVyaW5nIGJsb2NrIGFsbG9jYXRp
b24sIGl0IHdpbGwgbm90IGJlDQo+PiBpbmNsdWRlZCBpbiB0aGUgbWFwIHN0cnVjdCBieSBtYXBf
aXNfbWVyZ2VhYmxlKCkgaWYgdGhlIExCQSBvZiB0aGUNCj4NCj5JIGRpZG4ndCBnZXQgaXQsIHdo
eSBiZWxvdyBjb25kaXRpb24gaW4gbWFwX2lzX21lcmdlYWJsZSgpIGNhbiBub3QgY2F0Y2ggdGhp
cw0KPmNhc2U/IENhbiB5b3UgcGxlYXNlIGV4cGxhaW4gbW9yZT8NCj4NCj7CoCDCoCDCoCDCoGlm
IChtYXAtPm1fcGJsayAhPSBORVdfQUREUiAmJiBibGthZGRyID09IChtYXAtPm1fcGJsayArIG9m
cykpDQo+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gdHJ1ZTsNCj4NCg0KVGhhbmsgeW91
IGZvciB5b3VyIHJldmlldy4NCm1hcF9pc19tZXJnZWFibGUoKSByZXR1cm5zIHRydWUgd2hlbiB0
aGUgbGFzdCBibG9jayBpbiB0aGUgc2VjdGlvbiBpcyBtZXJnZWQuDQpUaGUgcHJvYmxlbSBpcyB0
aGUgbmV4dCBibG9jayBhbGxvY2F0aW9uLCB3aGljaCBoYXBwZW5zIGNvbnNlY3V0aXZlbHkuDQpT
aW5jZSBpdCB3aWxsIGJlIGFsbG9jYXRlZCBhIG5ldyBzZWN0aW9uLCBpdHMgYmxvY2sgd2lsbCBi
ZSB0aGUgZmlyc3QgDQpibG9jayBpbiB0aGUgc2VjdGlvbi4NCklmIHRoZSBuZXdseSBhbGxvY2F0
ZWQgc2VjdGlvbiBpcyBub3QgY29udGlndW91cyB3aXRoIHRoZSBwcmV2aW91cyBzZWN0aW9uLA0K
bWFwX2lzX21lcmdlYWJsZSgpIHdpbGwgcmV0dXJuIGZhbHNlLg0KU28gdGhlIGJsb2NrIGlzIGFs
bG9jYXRlZCBidXQgdW51c2VkLg0KSG93ZXZlciwgaXQgaXMgbm90IGZyZWVkLCBzbyB0aGUgYmxv
Y2sgaXMgdW51c2FibGUuDQpJZiBteSBleHBsYW5hdGlvbiB3YXMgbm90IGNsZWFyIGVub3VnaCwg
cGxlYXNlIGZlZWwgZnJlZSB0byBhc2sgcXVlc3Rpb25zLg0KDQpUaGFua3MNCkRhZWp1bg0KDQo+
VGhhbmtzLA0KPg0KPj4gYWxsb2NhdGVkIGJsb2NrIGlzIG5vdCBjb250aWd1b3VzLiBIb3dldmVy
LCB0aGUgYmxvY2sgYWxyZWFkeSBhbGxvY2F0ZWQNCj4+IGluIHRoaXMgcHJvY2VzcyB3aWxsIHJl
bWFpbiB1bnVzZWQgZHVlIHRvIHRoZSBMRlMgbW9kZS4NCj4+DQo+PiBUaGlzIHBhdGNoIGF2b2lk
cyB0aGUgcG9zc2liaWxpdHkgb2YgdW51c2VkIGJsb2NrcyBieSBlc2NhcGluZw0KPj4gZjJmc19t
YXBfYmxvY2tzKCkgd2hlbiBhbGxvY2F0aW5nIHRoZSBsYXN0IGJsb2NrIGluIGEgc2VjdGlvbi4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBEYWVqdW4gUGFyayA8ZGFlanVuNy5wYXJrQHNhbXN1bmcu
Y29tPg0KPj4gLS0tDQo+PsKgIGZzL2YyZnMvZGF0YS5jIDEzICsrKysrKysrKysrKysNCj4+wqAg
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYw0KPj4gaW5kZXggYjZkY2IzYmNhZWY3Li5iMjdh
M2Y0NDhmMzIgMTAwNjQ0DQo+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYw0KPj4gKysrIGIvZnMvZjJm
cy9kYXRhLmMNCj4+IEBAIC0xNzExLDYgKzE3MTEsMTkgQEAgaW50IGYyZnNfbWFwX2Jsb2Nrcyhz
dHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBmbGFn
KQ0KPj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRuLm9mc19pbl9ub2RlID0gZW5kX29m
ZnNldDsNCj4+wqAgwqAgwqAgwqAgwqAgwqB9DQo+PsKgDQo+PiArIMKgIMKgIMKgIMKgaWYgKGZs
YWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPICYmIGYyZnNfbGZzX21vZGUoc2JpKSkgew0KPj4gKyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludCBzZWdubyA9IEdFVF9TRUdOTyhzYmksIGJsa2FkZHIp
Ow0KPj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJvb2wgbGFzdF9zZWcsIGxhc3RfYmxrOw0K
Pj4gKw0KPj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhc3Rfc2VnID0gISgoc2Vnbm8gKyAx
KSAlIFNFR1NfUEVSX1NFQyhzYmkpKTsNCj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYXN0
X2JsayA9IChmMmZzX3VzYWJsZV9ibGtzX2luX3NlZyhzYmksIHNlZ25vKSAtIDEpID09DQo+PiAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgR0VUX0JMS09G
Rl9GUk9NX1NFRzAoc2JpLCBibGthZGRyKTsNCj4+ICsNCj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAvKiBMQkEgb2YgdGhlIG5leHQgYmxvY2sgdG8gYmUgYWxsb2NhdGVkIG1heSBub3QgYmUg
Y29udGlndW91cy4gKi8NCj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAobGFzdF9zZWcg
JiYgbGFzdF9ibGspDQo+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290
byBzeW5jX291dDsNCj4+ICsgwqAgwqAgwqAgwqB9DQo+PiArDQo+PsKgIMKgIMKgIMKgIMKgIMKg
aWYgKHBnb2ZzID49IGVuZCkNCj4+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIHN5
bmNfb3V0Ow0KPj7CoCDCoCDCoCDCoCDCoCDCoGVsc2UgaWYgKGRuLm9mc19pbl9ub2RlIDwgZW5k
X29mZnNldCkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
