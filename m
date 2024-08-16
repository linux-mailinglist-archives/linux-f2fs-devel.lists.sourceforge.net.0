Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08264954015
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2024 05:38:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1senmv-0007J5-2U;
	Fri, 16 Aug 2024 03:38:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1senmt-0007Ix-6G
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 03:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GKT9n0LE/jRTJ8z1XbxXBjjNKVz+g51Bm3M2MeL+xOg=; b=LOuVZGQdFVT5jg4WgiVbtnuPHt
 /E+KSI4+CWxQFVAdgcWSkD0EZbFdqWLURDXyl1fIMGbgmg2Ul8r8QF6zjqx8bPNRn+7hHuA/38SSU
 w+kxLXVTp0rYEgxtIeHcv/uCoFbIgSKTNXbEkSG9+8nN2nULi6dzbqVRhjnX4nhaA9mw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GKT9n0LE/jRTJ8z1XbxXBjjNKVz+g51Bm3M2MeL+xOg=; b=evP6e1fy17HYX2a/coMuu0ZP+B
 63q8ApqD0nTOyvw4bfXIwvEYD+KAsV9vJajC0MRt6DIiCphDLsyqt7yQgYBMYr05FpIgW58lSO1UQ
 1VNDmMdjqVliGmpHh4czUPMjG+Q/S2LhMSXPlzoYwLOzwhtfGGfsclPiZ6edIihp6rnk=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1senmr-0005wB-Kl for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 03:38:03 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240816033749epoutp0275b120b0f22462a0989635ace57ae2f8~sGEtgb8DJ0670606706epoutp02N
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Aug 2024 03:37:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240816033749epoutp0275b120b0f22462a0989635ace57ae2f8~sGEtgb8DJ0670606706epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1723779469;
 bh=GKT9n0LE/jRTJ8z1XbxXBjjNKVz+g51Bm3M2MeL+xOg=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=G2XZcvrwxIqrDUfpmo7lvT8Fh+V2/q/2YntDB/72s95vENs0qrPwk8EqPRm7DIcuZ
 yGvyI5/U0f81NqLLyrnkl5SgJH6yGRv8J+DdFutgfkPp4KHqquxQGcycC7dy/oZeWz
 EPL/dyak5lyAl0WRyvnXIOQA7pgfVtQ10AQ22yak=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20240816033748epcas2p21e8082e28157ac62f689a9898fad1f4b~sGEtEzYOo1534215342epcas2p2B;
 Fri, 16 Aug 2024 03:37:48 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.70]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4WlSP82RrBz4x9Q1; Fri, 16 Aug
 2024 03:37:48 +0000 (GMT)
X-AuditID: b6c32a43-a61b8700000022c5-8f-66bec98c553b
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 49.59.08901.C89CEB66; Fri, 16 Aug 2024 12:37:48 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <5b892d6a-620d-47f4-b870-214dcf4bc480@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240816033647epcms2p69f1121d4e0ac69d5b0ebf03288fefba7@epcms2p6>
Date: Fri, 16 Aug 2024 12:36:47 +0900
X-CMS-MailID: 20240816033647epcms2p69f1121d4e0ac69d5b0ebf03288fefba7
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmmW7PyX1pBpcfs1ucnnqWyeLlIU2L
 VQ/CLX6cNLHo393OYvFk/Sxmi/tbrzFaXFrkbnF51xw2i5Y/ThbnJ75msljVMZfRYur5I0wO
 vB6bVnWyeexe8JnJo2/LKkaPz5vkAliism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUN
 LS3MlRTyEnNTbZVcfAJ03TJzgE5TUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSY
 F+gVJ+YWl+al6+WlllgZGhgYmQIVJmRnHF+3grFgrVHF5OMH2RsYGw27GDk5JARMJK7+ecva
 xcjFISSwg1FiyZ9l7F2MHBy8AoISf3cIg9QICwRKrH9/hR3EFhJQklh/cRY7RFxP4tbDNYwg
 NpuAjsT0E/fZQeaICDxglJhyYy8bSIJZYC+TRNPyMohlvBIz2p+yQNjSEtuXbwVr5hSwk3hx
 cx0rRFxD4seyXmYIW1Ti5uq37DD2+2PzGSFsEYnWe2ehagQlHvzcDRWXlLg9dxNUfb7E/yvL
 oewaiW0H5kHZ+hLXOjayQPzoK7F4fyhImEVAVeLfqvVQI10kGue/YYE4X1ti2cLXzCDlzAKa
 Eut36YOYEgLKEkduQVXwSXQc/ssO82DDxt9Y2TvmPWGCsNUk1v1czzSBUXkWIpxnIdk1C2HX
 AkbmVYxiqQXFuempyUYFhvCoTc7P3cQITqNazjsYr8z/p3eIkYmD8RCjBAezkgjv0y9704R4
 UxIrq1KL8uOLSnNSiw8xmgJ9OZFZSjQ5H5jI80riDU0sDUzMzAzNjUwNzJXEee+1zk0REkhP
 LEnNTk0tSC2C6WPi4JRqYPLyOiRbcVdw9fvH+S4Zdq+2bXxtr+Kpv1JNUPqh5R+N73tLNwhI
 rXvoF/wixPuK06KQi5nsOSY9GStk9q34ccHtxTMji1bJzvWqmsKFmnXyPNEiV6w9tJitHwtK
 T6pb4cy9hf1Ap9Li3Vc4jJtm/z8Vwaj2xHznxKM+z5hfPmyo11/zeF3R+4/p4T+XuxUXuLdc
 YGDLqkl3ipY6I7t5Ytgzg9Dui0/i3GcK+E+eXZCaPPMCi2gh09Tn2ltmtRwU8WKOeTdD567Y
 80C3VMHVD1wXzP5kFnpD6q+fTHHz4WOblRZy1dXo/Vlwpdb9a6592f6ip+7xE25nti227bkq
 bZA8i7kg+8TB0nz2PU/NlFiKMxINtZiLihMBDzRXWCwEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b
References: <5b892d6a-620d-47f4-b870-214dcf4bc480@kernel.org>
 <7860b050-3948-4e23-b40f-a3df522477cd@kernel.org>
 <20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b@epcms2p7>
 <20240816001700epcms2p37f406e9cd3a1d6438a866e7a7a3d5c31@epcms2p3>
 <CGME20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b@epcms2p6>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Chao Yu, >  >--------- Original Message --------- >Sender
    : Chao Yu <chao@kernel.org> >Date : 2024-08-16 10:56 (GMT+9) >Title : Re:
    (2) [PATCH] f2fs: avoid unused block when dio write in LFS mode >  >On 2024
    [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: samsung.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [203.254.224.25 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [203.254.224.25 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [203.254.224.25 listed in list.dnswl.org]
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
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1senmr-0005wB-Kl
Subject: Re: [f2fs-dev] (2) (2) [PATCH] f2fs: avoid unused block when dio
 write in LFS mode
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

SGkgQ2hhbyBZdSwKCj7CoA0KPi0tLS0tLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tLS0tLQ0K
PlNlbmRlciA6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4NCj5EYXRlIDogMjAyNC0wOC0xNiAx
MDo1NiAoR01UKzkpDQo+VGl0bGUgOiBSZTogKDIpIFtQQVRDSF0gZjJmczogYXZvaWQgdW51c2Vk
IGJsb2NrIHdoZW4gZGlvIHdyaXRlIGluIExGUyBtb2RlDQo+wqANCj5PbiAyMDI0LzgvMTYgODox
NywgRGFlanVuIFBhcmsgd3JvdGU6DQo+PiBIaSBDaGFvIFl1LA0KPj4+wqANCj4+PiAtLS0tLS0t
LS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLS0tLS0NCj4+PiBTZW5kZXIgOiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+DQo+Pj4gRGF0ZSA6IDIwMjQtMDgtMTQgMTg6NTAgKEdNVCs5KQ0KPj4+IFRp
dGxlIDogUmU6IFtQQVRDSF0gZjJmczogYXZvaWQgdW51c2VkIGJsb2NrIHdoZW4gZGlvIHdyaXRl
IGluIExGUyBtb2RlDQo+Pj7CoA0KPj4+IE9uIDIwMjQvOC8xIDE1OjQ3LCBEYWVqdW4gUGFyayB3
cm90ZToNCj4+Pj4gVGhpcyBwYXRjaCBhZGRyZXNzZXMgdGhlIHByb2JsZW0gdGhhdCB3aGVuIHVz
aW5nIExGUyBtb2RlLCB1bnVzZWQgYmxvY2tzDQo+Pj4+IG1heSBvY2N1ciBpbiBmMmZzX21hcF9i
bG9ja3MoKSBkdXJpbmcgYmxvY2sgYWxsb2NhdGlvbiBmb3IgZGlvIHdyaXRlcy4NCj4+Pj4NCj4+
Pj4gSWYgYSBuZXcgc2VjdGlvbiBpcyBhbGxvY2F0ZWQgZHVyaW5nIGJsb2NrIGFsbG9jYXRpb24s
IGl0IHdpbGwgbm90IGJlDQo+Pj4+IGluY2x1ZGVkIGluIHRoZSBtYXAgc3RydWN0IGJ5IG1hcF9p
c19tZXJnZWFibGUoKSBpZiB0aGUgTEJBIG9mIHRoZQ0KPj4+DQo+Pj4gSSBkaWRuJ3QgZ2V0IGl0
LCB3aHkgYmVsb3cgY29uZGl0aW9uIGluIG1hcF9pc19tZXJnZWFibGUoKSBjYW4gbm90IGNhdGNo
IHRoaXMNCj4+PiBjYXNlPyBDYW4geW91IHBsZWFzZSBleHBsYWluIG1vcmU/DQo+Pj4NCj4+PsKg
IMKgIMKgIMKgIMKgaWYgKG1hcC0+bV9wYmxrICE9IE5FV19BRERSICYmIGJsa2FkZHIgPT0gKG1h
cC0+bV9wYmxrICsgb2ZzKSkNCj4+PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIHRy
dWU7DQo+Pj4NCj4+DQo+PiBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KPj4gbWFwX2lzX21l
cmdlYWJsZSgpIHJldHVybnMgdHJ1ZSB3aGVuIHRoZSBsYXN0IGJsb2NrIGluIHRoZSBzZWN0aW9u
IGlzIG1lcmdlZC4NCj4+IFRoZSBwcm9ibGVtIGlzIHRoZSBuZXh0IGJsb2NrIGFsbG9jYXRpb24s
IHdoaWNoIGhhcHBlbnMgY29uc2VjdXRpdmVseS4NCj4+IFNpbmNlIGl0IHdpbGwgYmUgYWxsb2Nh
dGVkIGEgbmV3IHNlY3Rpb24sIGl0cyBibG9jayB3aWxsIGJlIHRoZSBmaXJzdA0KPj4gYmxvY2sg
aW4gdGhlIHNlY3Rpb24uDQo+PiBJZiB0aGUgbmV3bHkgYWxsb2NhdGVkIHNlY3Rpb24gaXMgbm90
IGNvbnRpZ3VvdXMgd2l0aCB0aGUgcHJldmlvdXMgc2VjdGlvbiwNCj4+IG1hcF9pc19tZXJnZWFi
bGUoKSB3aWxsIHJldHVybiBmYWxzZS4NCj4+IFNvIHRoZSBibG9jayBpcyBhbGxvY2F0ZWQgYnV0
IHVudXNlZC4NCj4+IEhvd2V2ZXIsIGl0IGlzIG5vdCBmcmVlZCwgc28gdGhlIGJsb2NrIGlzIHVu
dXNhYmxlLg0KPj4gSWYgbXkgZXhwbGFuYXRpb24gd2FzIG5vdCBjbGVhciBlbm91Z2gsIHBsZWFz
ZSBmZWVsIGZyZWUgdG8gYXNrIHF1ZXN0aW9ucy4NCj4NCj5JdCdzIGNsZWFyIHRvIG1lIG5vdywg
dGhhbmtzIGZvciB5b3VyIGV4cGxhbmF0aW9uLg0KPg0KPj4NCj4+IFRoYW5rcw0KPj4gRGFlanVu
DQo+Pg0KPj4+IFRoYW5rcywNCj4+Pg0KPj4+PiBhbGxvY2F0ZWQgYmxvY2sgaXMgbm90IGNvbnRp
Z3VvdXMuIEhvd2V2ZXIsIHRoZSBibG9jayBhbHJlYWR5IGFsbG9jYXRlZA0KPj4+PiBpbiB0aGlz
IHByb2Nlc3Mgd2lsbCByZW1haW4gdW51c2VkIGR1ZSB0byB0aGUgTEZTIG1vZGUuDQo+Pj4+DQo+
Pj4+IFRoaXMgcGF0Y2ggYXZvaWRzIHRoZSBwb3NzaWJpbGl0eSBvZiB1bnVzZWQgYmxvY2tzIGJ5
IGVzY2FwaW5nDQo+Pj4+IGYyZnNfbWFwX2Jsb2NrcygpIHdoZW4gYWxsb2NhdGluZyB0aGUgbGFz
dCBibG9jayBpbiBhIHNlY3Rpb24uDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IERhZWp1biBQ
YXJrIDxkYWVqdW43LnBhcmtAc2Ftc3VuZy5jb20+DQo+Pj4+IC0tLQ0KPj4+PsKgIMKgIGZzL2Yy
ZnMvZGF0YS5jIDEzICsrKysrKysrKysrKysNCj4+Pj7CoCDCoCAxIGZpbGUgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9m
cy9mMmZzL2RhdGEuYw0KPj4+PiBpbmRleCBiNmRjYjNiY2FlZjcuLmIyN2EzZjQ0OGYzMiAxMDA2
NDQNCj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMNCj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMN
Cj4+Pj4gQEAgLTE3MTEsNiArMTcxMSwxOSBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1hcCwgaW50IGZsYWcpDQo+Pj4+
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkbi5vZnNfaW5fbm9kZSA9IGVuZF9vZmZz
ZXQ7DQo+Pj4+wqAgwqAgwqAgwqAgwqAgwqAgwqB9DQo+Pj4+wqANCj4+Pj4gKyDCoCDCoCDCoCDC
oGlmIChmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTyAmJiBmMmZzX2xmc19tb2RlKHNiaSkpIHsN
Cj4NCj5UaGUgY29uZGl0aW9uIHNob3VsZCBjaGVjayBtYXAtPm1fbWF5X2NyZWF0ZSBhcyB3ZWxs
LCBvdGhlcndpc2UgZjJmc19tYXBfYmxvY2tzKCkNCj5mcm9tIHJlYWQgcGF0aCB3aWxsIGJyZWFr
IGhlcmU/DQoNCkkgd2lsbCBhZGQgY2hlY2tpbmcgbWFwLT5tX21heV9jcmVhdGUuDQoNCj4NCj4+
Pj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludCBzZWdubyA9IEdFVF9TRUdOTyhzYmksIGJs
a2FkZHIpOw0KPj4+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYm9vbCBsYXN0X3NlZywgbGFz
dF9ibGs7DQo+Pj4+ICsNCj4+Pj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhc3Rfc2VnID0g
ISgoc2Vnbm8gKyAxKSAlIFNFR1NfUEVSX1NFQyhzYmkpKTsNCj4NCj5TaG91bGQgY29uc2lkZXIg
dGhlIGNhc2UgdGhhdCBzZWdubyAjKFNFR1NfUEVSX1NFQyAtIDEpIGlzIG5vdCB2YWxpZD8NCj5l
LmcuIFNFR1NfUEVSX1NFQyBpcyA0LCBDQVBfU0VHU19QRVJfU0VDIGlzIDI/DQo+DQo+Pj4+ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYXN0X2JsayA9IChmMmZzX3VzYWJsZV9ibGtzX2luX3Nl
ZyhzYmksIHNlZ25vKSAtIDEpID09DQo+Pj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBHRVRfQkxLT0ZGX0ZST01fU0VHMChzYmksIGJsa2FkZHIpOw0K
Pg0KPmlmIChHRVRfU0VHT0ZGX0ZST01fU0VHMCgpICUgQkxLU19QRVJfU0VDKCkgPT0gQ0FQX0JM
S1NfUEVSX1NFQygpIC0gMSkNCj7CoCDCoCDCoCDCoGdvdG8gc3luY19vdXQ7DQoNCkkgd2lsbCB1
c2UgdGhlIHN1Z2dlc3RlZCBjaGVja2luZyBjb2RlLg0KDQpUaGFua3MsDQpEYWVqdW4NCg0KPg0K
PlRoYW5rcywNCj4NCj4+Pj4gKw0KPj4+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogTEJB
IG9mIHRoZSBuZXh0IGJsb2NrIHRvIGJlIGFsbG9jYXRlZCBtYXkgbm90IGJlIGNvbnRpZ3VvdXMu
ICovDQo+Pj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAobGFzdF9zZWcgJiYgbGFzdF9i
bGspDQo+Pj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIHN5bmNf
b3V0Ow0KPj4+PiArIMKgIMKgIMKgIMKgfQ0KPj4+PiArDQo+Pj4+wqAgwqAgwqAgwqAgwqAgwqAg
wqBpZiAocGdvZnMgPj0gZW5kKQ0KPj4+PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Z290byBzeW5jX291dDsNCj4+Pj7CoCDCoCDCoCDCoCDCoCDCoCDCoGVsc2UgaWYgKGRuLm9mc19p
bl9ub2RlIDwgZW5kX29mZnNldCkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
