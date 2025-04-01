Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C92C6A7726E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Apr 2025 03:52:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzQnm-0005gT-Og;
	Tue, 01 Apr 2025 01:52:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1tzQnk-0005gK-Vb
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Apr 2025 01:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xuD4nMhuNN9ahXwvKUASdaXHs+IHh7aI4cxa8H/DgaA=; b=DDb7K+MeojkkIAMhW20kmgYvFL
 9LWUuwWYsj2XL9A98Xix1d1QqnNulANbEdvfq8L56BrRw+NIkBbDrKzzWnzVS03bBp1frAbqyXvnz
 q9Mb7h8t3j9JczSDlhuUolumR7eikBLbARcMlnMCG8ogA3enUz67EZtBkGT0iY3UGMDc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xuD4nMhuNN9ahXwvKUASdaXHs+IHh7aI4cxa8H/DgaA=; b=XsBS15YXnVmQaYhiP6CU3CugXe
 w5fv6NuUUUOk1t+soSkTgg1itXEqRqB+ma1kUdz0qx5KYzQA+ML2xGChYjEIrn5FBgFsyeNlRsUCH
 MGwu7Gqr+p1W3rBv0MdqG4osHf0TndCGgqTI24m4V1tq1kCPrFSzg+ogdo00KSLpXxkw=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tzQnS-00012N-Dn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Apr 2025 01:52:28 +0000
X-AuditID: a67dfc59-03fff7000000aab6-28-67eb46bd9342
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  1 Apr 2025 10:51:52 +0900
Message-ID: <20250401015156.2623-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <b51283c6-ec5b-48ba-a1a1-b16911a5c5c8@kernel.org>
References: <b51283c6-ec5b-48ba-a1a1-b16911a5c5c8@kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsXC9ZZnoe5et9fpBms3KFicnnqWyeLJ+lnM
 Fl+uXmO3uLTI3eLyrjlsDqweO2fdZffYtKqTzWP3gs9MHp83yQWwRHHZpKTmZJalFunbJXBl
 tN+YyFbwPqni7bsHzA2Mk/27GDk5JARMJGZ9XMsKYz87/pgdxGYT0JD409vLDGKLCGhJTGz4
 y9jFyMXBLNDJKLH+4GdWEEdYYDOjxN/XE8GqWARUJT6uesoIYvMKmEnsXXSYCWKqpsSOL+fB
 bE4BO4ln9++C2UICthL3Jn9lgqgXlDg58wlLFyMH0AZ1ifXzhEDCzALyEs1bZzOD7JIQWMAm
 cfpsD9RMSYmDK26wTGAUmIWkfRZC+ywk7QsYmVcximTmleUmZuYY6xVnZ1TmZVboJefnbmIE
 hvCy2j+ROxi/XQg+xCjAwajEw7uh9FW6EGtiWXFl7iFGCQ5mJRHeiK8v04V4UxIrq1KL8uOL
 SnNSiw8xSnOwKInzGn0rTxESSE8sSc1OTS1ILYLJMnFwSjUwyvfsrfM68jTv06aX0erTnvzN
 7z2iELlZUV/oWNXaDyn/l1vP+/Dwm0WTv+RGsfPR7AknNJXDcy6W/thSsNc84Ic2v/XHbyF6
 y437LsutU4vk354w7/9tj/hQ601XrzSsUl4t5Oln8zZf7qLCubL7AcEsRUo2qxb8jZb/d+Lo
 ca61Emdeq9/UVmIpzkg01GIuKk4EAB3hplxdAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMLMWRmVeSWpSXmKPExsXCNUNlju5et9fpBi9/ilmcnnqWyeLJ+lnM
 Fl+uXmO3uLTI3eLyrjlsFhPmXmWyeL/1HqMDu8fOWXfZPTat6mTz2L3gM5PHt9seHp83yQWw
 RnHZpKTmZJalFunbJXBltN+YyFbwPqni7bsHzA2Mk/27GDk5JARMJJ4df8wOYrMJaEj86e1l
 BrFFBLQkJjb8Zexi5OJgFuhklFh/8DMriCMssJlR4u/riWBVLAKqEh9XPWUEsXkFzCT2LjrM
 BDFVU2LHl/NgNqeAncSz+3fBbCEBW4l7k78yQdQLSpyc+YSli5EDaIO6xPp5QiBhZgF5ieat
 s5knMPLOQlI1C6FqFpKqBYzMqxhFMvPKchMzc8z0irMzKvMyK/SS83M3MQKDclntn0k7GL9d
 dj/EKMDBqMTDu6H0VboQa2JZcWXuIUYJDmYlEd6Iry/ThXhTEiurUovy44tKc1KLDzFKc7Ao
 ifN6hacmCAmkJ5akZqemFqQWwWSZODilGhhDTt2c/0WzqOjuQS//pHkT4gW2GNoZB7L1hH82
 2P0p9/XlkAdzBX616gb8ElyW/ubi1pVL98clp7V5Xj0zs57p+CQxvurbOZ/bo8UWKImuPZdw
 qerTefvQNNFth/sWLGFmPKsutGTBjF9OXQ27Ul3XNZ6z7/y2vUdpdrrEJ47N+9X6Geqfz5mj
 xFKckWioxVxUnAgAxsNS+0YCAAA=
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  >From: Chao Yu <chao@kernel.org> >Sent: Monday, March 31,
   2025 8:36 PM >To: 정요한(JOUNG YOHAN) Mobile AE <yohan.joung@sk.com>; linux-f2fs-
    >devel@lists.sourceforge.net >Cc: chao@kernel.org; jaegeu [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [166.125.252.90 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [166.125.252.90 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1tzQnS-00012N-Dn
Subject: [f2fs-dev] [External Mail] Re: [External Mail] Re: [External Mail]
 Re: [PATCH] f2fs: prevent the current section from being selected as a
 victim during garbage collection
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
Cc: jyh429@gmail.com, linux-kernel@vger.kernel.org, jaegeuk@kernel.org,
 pilhyun.kim@sk.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PkZyb206IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPlNlbnQ6IE1vbmRheSwgTWFyY2ggMzEs
IDIwMjUgODozNiBQTQo+VG86IOygleyalO2VnChKT1VORyBZT0hBTikgTW9iaWxlIEFFIDx5b2hh
bi5qb3VuZ0Bzay5jb20+OyBsaW51eC1mMmZzLQo+ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cj5DYzogY2hhb0BrZXJuZWwub3JnOyBqYWVnZXVrQGtlcm5lbC5vcmc7IGp5aDQyOUBnbWFpbC5j
b207IGxpbnV4LQo+a2VybmVsQHZnZXIua2VybmVsLm9yZzsg6rmA7ZWE7ZiEKEtJTSBQSUxIWVVO
KSBNb2JpbGUgQUUgPHBpbGh5dW4ua2ltQHNrLmNvbT4KPlN1YmplY3Q6IFtFeHRlcm5hbCBNYWls
XSBSZTogW0V4dGVybmFsIE1haWxdIFJlOiBbZjJmcy1kZXZdIFtFeHRlcm5hbCBNYWlsXQo+UmU6
IFtFeHRlcm5hbCBNYWlsXSBSZTogW1BBVENIXSBmMmZzOiBwcmV2ZW50IHRoZSBjdXJyZW50IHNl
Y3Rpb24gZnJvbQo+YmVpbmcgc2VsZWN0ZWQgYXMgYSB2aWN0aW0gZHVyaW5nIGdhcmJhZ2UgY29s
bGVjdGlvbgo+Cj5PbiAzLzMxLzI1IDEzOjEzLCB5b2hhbi5qb3VuZyB3cm90ZToKPj4+IE9uIDIw
MjUvMy8yOCAxNToyNSwgeW9oYW4uam91bmcgd3JvdGU6Cj4+Pj4+IE9uIDIwMjUvMy8yOCAxMTo0
MCwgeW9oYW4uam91bmcgd3JvdGU6Cj4+Pj4+Pj4gRnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPgo+Pj4+Pj4+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyNywgMjAyNSAxMDo0OCBQTQo+Pj4+
Pj4+IFRvOiDsoJXsmpTtlZwoSk9VTkcgWU9IQU4pIE1vYmlsZSBBRSA8eW9oYW4uam91bmdAc2su
Y29tPjsgWW9oYW4gSm91bmcKPj4+Pj4+PiA8anloNDI5QGdtYWlsLmNvbT47IGphZWdldWtAa2Vy
bmVsLm9yZzsgZGFlaG80M0BnbWFpbC5jb20KPj4+Pj4+PiBDYzogY2hhb0BrZXJuZWwub3JnOyBs
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsKPj4+Pj4+PiBsaW51eC0ga2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsg6rmA7ZWE7ZiEKEtJTSBQSUxIWVVOKSBNb2JpbGUgQUUKPj4+
Pj4+PiA8cGlsaHl1bi5raW1Ac2suY29tPgo+Pj4+Pj4+IFN1YmplY3Q6IFtFeHRlcm5hbCBNYWls
XSBSZTogW0V4dGVybmFsIE1haWxdIFJlOiBbRXh0ZXJuYWwgTWFpbF0gUmU6Cj4+Pj4+Pj4gW1BB
VENIXSBmMmZzOiBwcmV2ZW50IHRoZSBjdXJyZW50IHNlY3Rpb24gZnJvbSBiZWluZyBzZWxlY3Rl
ZCBhcwo+Pj4+Pj4+IGEgdmljdGltIGR1cmluZyBnYXJiYWdlIGNvbGxlY3Rpb24KPj4+Pj4+Pgo+
Pj4+Pj4+IE9uIDIwMjUvMy8yNyAxNjowMCwgeW9oYW4uam91bmdAc2suY29tIHdyb3RlOgo+Pj4+
Pj4+Pj4gRnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+Pj4+Pj4+Pj4gU2VudDogVGh1
cnNkYXksIE1hcmNoIDI3LCAyMDI1IDQ6MzAgUE0KPj4+Pj4+Pj4+IFRvOiDsoJXsmpTtlZwoSk9V
TkcgWU9IQU4pIE1vYmlsZSBBRSA8eW9oYW4uam91bmdAc2suY29tPjsgWW9oYW4KPj4+Pj4+Pj4+
IEpvdW5nIDxqeWg0MjlAZ21haWwuY29tPjsgamFlZ2V1a0BrZXJuZWwub3JnOyBkYWVobzQzQGdt
YWlsLmNvbQo+Pj4+Pj4+Pj4gQ2M6IGNoYW9Aa2VybmVsLm9yZzsgbGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQ7Cj4+Pj4+Pj4+PiBsaW51eC0ga2VybmVsQHZnZXIua2VybmVs
Lm9yZzsg6rmA7ZWE7ZiEKEtJTSBQSUxIWVVOKSBNb2JpbGUgQUUKPj4+Pj4+Pj4+IDxwaWxoeXVu
LmtpbUBzay5jb20+Cj4+Pj4+Pj4+PiBTdWJqZWN0OiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtFeHRl
cm5hbCBNYWlsXSBSZTogW1BBVENIXSBmMmZzOgo+Pj4+Pj4+Pj4gcHJldmVudCB0aGUgY3VycmVu
dCBzZWN0aW9uIGZyb20gYmVpbmcgc2VsZWN0ZWQgYXMgYSB2aWN0aW0KPj4+Pj4+Pj4+IGR1cmlu
ZyBnYXJiYWdlIGNvbGxlY3Rpb24KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBPbiAzLzI3LzI1IDE0OjQz
LCB5b2hhbi5qb3VuZ0Bzay5jb20gd3JvdGU6Cj4+Pj4+Pj4+Pj4+IEZyb206IENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4KPj4+Pj4+Pj4+Pj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDI3LCAyMDI1
IDM6MDIgUE0KPj4+Pj4+Pj4+Pj4gVG86IFlvaGFuIEpvdW5nIDxqeWg0MjlAZ21haWwuY29tPjsg
amFlZ2V1a0BrZXJuZWwub3JnOwo+Pj4+Pj4+Pj4+PiBkYWVobzQzQGdtYWlsLmNvbQo+Pj4+Pj4+
Pj4+PiBDYzogY2hhb0BrZXJuZWwub3JnOyBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldDsKPj4+Pj4+Pj4+Pj4gbGludXgtIGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IOygleya
lO2VnChKT1VORyBZT0hBTikgTW9iaWxlIEFFCj4+Pj4+Pj4+Pj4+IDx5b2hhbi5qb3VuZ0Bzay5j
b20+Cj4+Pj4+Pj4+Pj4+IFN1YmplY3Q6IFtFeHRlcm5hbCBNYWlsXSBSZTogW1BBVENIXSBmMmZz
OiBwcmV2ZW50IHRoZQo+Pj4+Pj4+Pj4+PiBjdXJyZW50IHNlY3Rpb24gZnJvbSBiZWluZyBzZWxl
Y3RlZCBhcyBhIHZpY3RpbSBkdXJpbmcKPj4+Pj4+Pj4+Pj4gZ2FyYmFnZSBjb2xsZWN0aW9uCj4+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IE9uIDMvMjYvMjUgMjI6MTQsIFlvaGFuIEpvdW5nIHdyb3Rl
Ogo+Pj4+Pj4+Pj4+Pj4gV2hlbiBzZWxlY3RpbmcgYSB2aWN0aW0gdXNpbmcgbmV4dF92aWN0aW1f
c2VnIGluIGEgbGFyZ2UKPj4+Pj4+Pj4+Pj4+IHNlY3Rpb24sIHRoZSBzZWxlY3RlZCBzZWN0aW9u
IG1pZ2h0IGFscmVhZHkgaGF2ZSBiZWVuCj4+Pj4+Pj4+Pj4+PiBjbGVhcmVkIGFuZCBkZXNpZ25h
dGVkIGFzIHRoZSBuZXcgY3VycmVudCBzZWN0aW9uLCBtYWtpbmcgaXQKPj4+Pj4+Pj4+Pj4+IGFj
dGl2ZWx5IGluCj4+Pj4+IHVzZS4KPj4+Pj4+Pj4+Pj4+IFRoaXMgYmVoYXZpb3IgY2F1c2VzIGlu
Y29uc2lzdGVuY3kgYmV0d2VlbiB0aGUgU0lUIGFuZCBTU0EuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+IEhpLCBkb2VzIHRoaXMgZml4IHlvdXIgaXNzdWU/Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBU
aGlzIGlzIGFuIGlzc3VlIHRoYXQgYXJpc2VzIHdoZW4gZGl2aWRpbmcgYSBsYXJnZSBzZWN0aW9u
Cj4+Pj4+Pj4+Pj4gaW50byBzZWdtZW50cyBmb3IgZ2FyYmFnZSBjb2xsZWN0aW9uLgo+Pj4+Pj4+
Pj4+IGNhdXNlZCBieSB0aGUgYmFja2dyb3VuZCBHQyAoZ2FyYmFnZSBjb2xsZWN0aW9uKSB0aHJl
YWQgaW4KPj4+Pj4+Pj4+PiBsYXJnZSBzZWN0aW9uCj4+Pj4+Pj4+Pj4gZjJmc19nYyh2aWN0aW1f
c2VjdGlvbikgLT4KPj4+Pj4+Pj4+PiBmMmZzX2NsZWFyX3ByZWZyZWVfc2VnbWVudHModmljdGlt
X3NlY3Rpb24pLT4KPj4+Pj4+Pj4+PiBjdXJzZWModmljdGltX3NlY3Rpb24pIC0+IGYyZnNfZ2Mo
dmljdGltX3NlY3Rpb24gYnkKPj4+Pj4+Pj4+PiBuZXh0X3ZpY3RpbV9zZWcpCj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4gSSBkaWRuJ3QgZ2V0IGl0LCB3aHkgZjJmc19nZXRfdmljdGltKCkgd2lsbCByZXR1
cm4gc2VjdGlvbgo+Pj4+Pj4+Pj4gd2hpY2ggaXMgdXNlZCBieSBjdXJzZWc/IEl0IHNob3VsZCBi
ZSBhdm9pZGVkIGJ5IGNoZWNraW5nIHcvCj4+PiBzZWNfdXNhZ2VfY2hlY2soKS4KPj4+Pj4+Pj4+
Cj4+Pj4+Pj4+PiBPciB3ZSBtaXNzZWQgdG8gY2hlY2sgZ2Npbmcgc2VjdGlvbiB3aGljaCBuZXh0
X3ZpY3RpbV9zZWcKPj4+Pj4+Pj4+IHBvaW50cyB0byBkdXJpbmcgZ2V0X25ld19zZWdtZW50KCk/
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gQ2FuIHRoaXMgaGFwcGVuPwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
IGUuZy4KPj4+Pj4+Pj4+IC0gYmdnYyBzZWxlY3RzIHNlYyAjMAo+Pj4+Pj4+Pj4gLSBuZXh0X3Zp
Y3RpbV9zZWc6IHNlZyAjMAo+Pj4+Pj4+Pj4gLSBtaWdyYXRlIHNlZyAjMCBhbmQgc3RvcAo+Pj4+
Pj4+Pj4gLSBuZXh0X3ZpY3RpbV9zZWc6IHNlZyAjMQo+Pj4+Pj4+Pj4gLSBjaGVja3BvaW50LCBz
ZXQgc2VjICMwIGZyZWUgaWYgc2VjICMwIGhhcyBubyB2YWxpZCBibG9ja3MKPj4+Pj4+Pj4+IC0g
YWxsb2NhdGUgc2VnICMwIGluIHNlYyAjMCBmb3IgY3Vyc2VnCj4+Pj4+Pj4+PiAtIGN1cnNlZyBt
b3ZlcyB0byBzZWcgIzEgYWZ0ZXIgYWxsb2NhdGlvbgo+Pj4+Pj4+Pj4gLSBiZ2djIHRyaWVzIHRv
IG1pZ3JhdGUgc2VnICMxCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pj4+PiBUaGF0
J3MgY29ycmVjdAo+Pj4+Pj4+PiBJbiBmMmZzX2dldF92aWN0aW0sIHdlIHVzZSBuZXh0X3ZpY3Rp
bV9zZWcgdG8gZGlyZWN0bHkganVtcCB0bwo+Pj4+Pj4+PiBnb3RfcmVzdWx0LCB0aGVyZWJ5IGJ5
cGFzc2luZyBzZWNfdXNhZ2VfY2hlY2sgV2hhdCBkbyB5b3UgdGhpbmsKPj4+Pj4+Pj4gYWJvdXQg
dGhpcyBjaGFuZ2U/Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEBAIC04NTAsMTUgKzg1MCwyMCBAQCBpbnQg
ZjJmc19nZXRfdmljdGltKHN0cnVjdCBmMmZzX3NiX2luZm8KPj4+Pj4+Pj4gKnNiaSwKPj4+Pj4+
PiB1bnNpZ25lZCBpbnQgKnJlc3VsdCwKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcC5taW5fc2Vnbm8gPSBzYmktPm5leHRfdmljdGltX3NlZ1tCR19HQ107Cj4+Pj4+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICpyZXN1bHQgPSBwLm1pbl9zZWdubzsKPj4+Pj4+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5uZXh0X3ZpY3RpbV9zZWdbQkdfR0NdID0g
TlVMTF9TRUdOTzsKPj4+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgZ290byBnb3RfcmVz
dWx0Owo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgfQo+Pj4+Pj4+PiAgICAgICAgICAgICAg
ICAgICAgaWYgKGdjX3R5cGUgPT0gRkdfR0MgJiYKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzYmktPm5leHRfdmljdGltX3NlZ1tGR19HQ10KPj4+Pj4+Pj4gIT0g
TlVMTF9TRUdOTykKPj4+IHsKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgcC5t
aW5fc2Vnbm8gPSBzYmktPm5leHRfdmljdGltX3NlZ1tGR19HQ107Cj4+Pj4+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICpyZXN1bHQgPSBwLm1pbl9zZWdubzsKPj4+Pj4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdID0gTlVMTF9T
RUdOTzsKPj4+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgZ290byBnb3RfcmVzdWx0Owo+
Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgfQo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsgICAgICAg
ICAgICAgICBzZWNubyA9IEdFVF9TRUNfRlJPTV9TRUcoc2JpLCBzZWdubyk7Cj4+Pj4+Pj4+ICsK
Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgIGlmIChzZWNfdXNhZ2VfY2hlY2soc2JpLCBzZWNubykp
Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPj4+Pj4+Pj4gKwo+
Pj4+Pj4+PiArICAgICAgICAgICAgICAgZ290byBnb3RfcmVzdWx0Owo+Pj4+Pj4+PiAgICAgICAg
ICAgIH0KPj4+Pj4+Pgo+Pj4+Pj4+IEJ1dCBzdGlsbCBhbGxvY2F0b3IgY2FuIGFzc2lnbiB0aGlz
IHNlZ21lbnQgYWZ0ZXIKPj4+Pj4+PiBzZWNfdXNhZ2VfY2hlY2soKSBpbiByYWNlIGNvbmRpdGlv
biwgcmlnaHQ/Cj4+Pj4+PiBTaW5jZSB0aGUgQkcgR0MgdXNpbmcgbmV4dF92aWN0aW0gIHRha2Vz
IHBsYWNlIGFmdGVyIHRoZSBTSVQKPj4+Pj4+IHVwZGF0ZSBpbiBkb19jaGVja3BvaW50LCBpdCBz
ZWVtcyB1bmxpa2VseSB0aGF0IGEgcmFjZSBjb25kaXRpb24KPj4+Pj4+IHdpdGgKPj4+Pj4gc2Vj
X3VzYWdlX2NoZWNrIHdpbGwgb2NjdXIuCj4+Pj4+Cj4+Pj4+IEkgbWVhbiB0aGlzOgo+Pj4+Pgo+
Pj4+PiAtIGdjX3RocmVhZAo+Pj4+PiAgICAtIGYyZnNfZ2MKPj4+Pj4gICAgIC0gZjJmc19nZXRf
dmljdGltCj4+Pj4+ICAgICAgLSBzZWNfdXNhZ2VfY2hlY2sgLS0tIHNlZ25vICMxIGlzIG5vdCB1
c2VkIGluIGFueSBjdXJzZWdzCj4+Pj4+IAkJCQkJLSBmMmZzX2FsbG9jYXRlX2RhdGFfYmxvY2sK
Pj4+Pj4gCQkJCQkgLSBuZXdfY3Vyc2VnCj4+Pj4+IAkJCQkJICAtIGdldF9uZXdfc2VnbWVudCBm
aW5kIHNlZ25vICMxCj4+Pj4+Cj4+Pj4+ICAgICAtIGRvX2dhcmJhZ2VfY29sbGVjdAo+Pj4+Pgo+
Pj4+PiBUaGFua3MsCj4+Pj4KPj4+PiAJCQkJCQkgIGRvX2NoZWNrcG9pbnQgc2VjMCBmcmVlCj4+
Pj4gCQkJCQkJICBJZiBzZWMwIGlzIG5vdCBmcmVlZCwgdGhlbgo+Pj4gc2Vnbm8xIHdpdGhpbiBz
ZWMwIGNhbm5vdCBiZQo+Pj4+IGFsbG9jYXRlZAo+Pj4+IC0gZ2NfdGhyZWFkCj4+Pj4gICAgLSBm
MmZzX2djCj4+Pj4gICAgIC0gZjJmc19nZXRfdmljdGltCj4+Pj4gICAgICAtIHNlY191c2FnZV9j
aGVjayAgLS0tIHNlZ25vICMxIGlzIG5vdCB1c2VkIGluIGFueSBjdXJzZWdzIChidXQKPj4+PiBz
ZWMwCj4+PiBpcyBhbHJlYWR5IHVzZWQpCj4+Pj4gCQkJCQkJCS0gZjJmc19hbGxvY2F0ZV9kYXRh
X2Jsb2NrCj4+Pj4gCQkJCQkJCS0gbmV3X2N1cnNlZwo+Pj4+IAkJCQkJCQktIGdldF9uZXdfc2Vn
bWVudCBmaW5kCj4+PiBzZWdubyAjMQo+Pj4+Cj4+Pj4gICAgIC0gZG9fZ2FyYmFnZV9jb2xsZWN0
Cj4+Pj4KPj4+PiBJIGFwcHJlY2lhdGUgeW91ciBwYXRjaCwgaXQgaXMgdW5kZXIgdGVzdGluZy4K
Pj4+PiBidXQgSSdtIHdvbmRlcmluZyBpZiB0aGVyZSdzIGEgcmlzayBvZiBhIHJhY2UgY29uZGl0
aW9uIGluIHRoaXMKPj4+PiBzaXR1YXRpb24KPj4+Cj4+PiBPaCwgeWVzLCBJIG1heSBtaXNzZWQg
dGhhdCBnZXRfbmV3X3NlZ21lbnQgY2FuIHJldHVybiBhIGZyZWUgc2VnbWVudAo+Pj4gaW4gcGFy
dGlhbCB1c2VkIHNlY3Rpb24uCj4+Pgo+Pj4gU28gd2hhdCBkbyB5b3UgdGhpbmsgb2YgdGhpcz8K
Pj4+IC0gY2hlY2sgQ1VSU0VHKCkgaW4gZG9fZ2FyYmFnZV9jb2xsZWN0KCkgYW5kIGdldF92aWN0
aW0oKQo+Pj4gLSByZXNldCBuZXh0X3ZpY3RpbV9zZWdbXSBpbiBnZXRfbmV3X3NlZ21lbnQoKSBh
bmQKPj4+IF9fc2V0X3Rlc3RfYW5kX2ZyZWUoKSBkdXJpbmcgY2hlY2twb2ludC4KPj4+Cj4+PiBU
aGFua3MsCj4+Cj4+IEhvdyBhYm91dCB1c2luZyB2aWN0aW1fc2VjbWFwPwo+PiBnY190aHJlYWQK
Pj4gCQkJCW11dGV4X2xvY2soJkRJUlRZX0koc2JpKS0+c2VnbGlzdF9sb2NrKTsKPj4gCQkJCV9f
c2V0X3Rlc3RfYW5kX2ZyZWUKPj4gCQkJCWNoZWNrIGN1ciBzZWN0aW9uIG5leHRfdmljdGltIGNs
ZWFyCj4+IAkJCQltdXRleF91bmxvY2soJmRpcnR5X2ktPnNlZ2xpc3RfbG9jayk7Cj4+Cj4+IG11
dGV4X2xvY2soJmRpcnR5LT5zZWdsaXN0X2xvY2spOwo+PiBmMmZzX2dldF92aWN0aW0KPj4gbXV0
ZXhfdW5sb2NrKCZkaXJ0eV9pLT5zZWdsaXN0X2xvY2spOwo+Pgo+PiBzdGF0aWMgaW5saW5lIHZv
aWQgX19zZXRfdGVzdF9hbmRfZnJlZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+ICAgICAg
ICAgICAgICAgICBpZiAobmV4dCA+PSBzdGFydF9zZWdubyArIHVzYWJsZV9zZWdzKSB7Cj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGlmICh0ZXN0X2FuZF9jbGVhcl9iaXQoc2Vjbm8sIGZyZWVf
aS0+ZnJlZV9zZWNtYXApKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZyZWVf
aS0+ZnJlZV9zZWN0aW9ucysrOwo+PiArCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICh0
ZXN0X2FuZF9jbGVhcl9iaXQoc2Vjbm8sIGRpcnR5X2ktPnZpY3RpbV9zZWNtYXApKQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bmV4dF92aWN0aW1fc2VnW0JHX0dDXSA9
Cj4+ICsgTlVMTF9TRUdOTzsKPgo+Q2FuIHRoaXMgaGFwcGVuPwo+Cj5zZWdzX3Blcl9zZWM9Mgo+
Cj4tIHNlZyMwIGFuZCBzZWcjMSBhcmUgYWxsIGRpcnR5Cj4tIGFsbCB2YWxpZCBibG9ja3MgYXJl
IHJlbW92ZWQgaW4gc2VnIzEKPi0gY2hlY2twb2ludCAtPiBzZWcjMSBiZWNvbWVzIGZyZWUKPi0g
Z2Mgc2VsZWN0IHRoaXMgc2VjIGFuZCBuZXh0X3ZpY3RpbV9zZWc9c2VnIzAKPi0gbWlncmF0ZSBz
ZWcjMCwgbmV4dF92aWN0aW1fc2VnPXNlZyMxCj4tIGFsbG9jYXRvciBhc3NpZ25zIHNlZyMxIHRv
IGN1cnNlZwo+LSBnYyB0cmllcyB0byBtaWdyYXRlIHNlZyMxCj4KPlRoYW5rcywKVGhlIGRldGFp
bGVkIHNjZW5hcmlvCnNlZ3NfcGVyX3NlYz0yCi0gc2VnIzAgYW5kIHNlZyMxIGFyZSBhbGwgZGly
dHkKLSBhbGwgdmFsaWQgYmxvY2tzIGFyZSByZW1vdmVkIGluIHNlZyMxCi0gZ2Mgc2VsZWN0IHRo
aXMgc2VjIGFuZCBuZXh0X3ZpY3RpbV9zZWc9c2VnIzAKLSBtaWdyYXRlIHNlZyMwLCBuZXh0X3Zp
Y3RpbV9zZWc9c2VnIzEKLSBjaGVja3BvaW50IC0+IHNlYyhzZWcjMCwgc2VnIzEpICBiZWNvbWVz
IGZyZWUKLSBhbGxvY2F0b3IgYXNzaWducyBzZWMoc2VnIzAsIHNlZyMxKSB0byBjdXJzZWcKLSBn
YyB0cmllcyB0byBtaWdyYXRlIHNlZyMxCj4KPj4gICAgICAgICAgICAgICAgIH0KPj4gICAgICAg
ICB9Cj4+Pgo+Pj4+Cj4+Pj4KPj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IElNTywgd2UgY2FuIGNsZWFy
IG5leHRfdmljdGltX3NlZ1tdIG9uY2Ugc2VjdGlvbiBpcyBmcmVlIGluCj4+Pj4+Pj4gX19zZXRf
dGVzdF9hbmRfZnJlZSgpPyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+Pj4+Pj4gSSB3aWxsIHRlc3Qg
aXQgYWNjb3JkaW5nIHRvIHlvdXIgc3VnZ2VzdGlvbi4KPj4+Pj4+IElmIHRoZXJlIGFyZSBubyBp
c3N1ZXMsIGNhbiBJIHN1Ym1pdCBpdCBhZ2FpbiB3aXRoIHRoZSBwYXRjaD8KPj4+Pj4+IFRoYW5r
cwo+Pj4+Pj4+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gICAgIGZzL2YyZnMvc2VnbWVudC5oIHwgMTMg
KysrKysrKysrKy0tLQo+Pj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3Nl
Z21lbnQuaCBiL2ZzL2YyZnMvc2VnbWVudC5oIGluZGV4Cj4+Pj4+Pj4gMDQ2NWRjMDBiMzQ5Li44
MjZlMzc5OTkwODUgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmgKPj4+Pj4+
PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuaAo+Pj4+Pj4+IEBAIC00NzMsOSArNDczLDE2IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZAo+Pj4+Pj4+IF9fc2V0X3Rlc3RfYW5kX2ZyZWUoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLAo+Pj4+Pj4+ICAgICAJCQlnb3RvIHNraXBfZnJlZTsKPj4+Pj4+PiAgICAg
CQluZXh0ID0gZmluZF9uZXh0X2JpdChmcmVlX2ktPmZyZWVfc2VnbWFwLAo+Pj4+Pj4+ICAgICAJ
CQkJc3RhcnRfc2Vnbm8gKyBTRUdTX1BFUl9TRUMoc2JpKSwKPj4+IHN0YXJ0X3NlZ25vKTsKPj4+
Pj4+PiAtCQlpZiAobmV4dCA+PSBzdGFydF9zZWdubyArIHVzYWJsZV9zZWdzKSB7Cj4+Pj4+Pj4g
LQkJCWlmICh0ZXN0X2FuZF9jbGVhcl9iaXQoc2Vjbm8sIGZyZWVfaS0KPj5mcmVlX3NlY21hcCkp
Cj4+Pj4+Pj4gLQkJCQlmcmVlX2ktPmZyZWVfc2VjdGlvbnMrKzsKPj4+Pj4+PiArCQlpZiAoKG5l
eHQgPj0gc3RhcnRfc2Vnbm8gKyB1c2FibGVfc2VncykgJiYKPj4+Pj4+PiArCQkJdGVzdF9hbmRf
Y2xlYXJfYml0KHNlY25vLCBmcmVlX2ktPmZyZWVfc2VjbWFwKSkKPnsKPj4+Pj4+PiArCQkJZnJl
ZV9pLT5mcmVlX3NlY3Rpb25zKys7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsJCQlpZiAoR0VUX1NFQ19G
Uk9NX1NFRyhzYmktPm5leHRfdmljdGltX3NlZ1tCR19HQ10pCj49PQo+Pj4+Pj4+ICsJCQkJCQkJ
CQlzZWNubykKPj4+Pj4+PiArCQkJCXNiaS0+bmV4dF92aWN0aW1fc2VnW0JHX0dDXSA9IE5VTExf
U0VHTk87Cj4+Pj4+Pj4gKwkJCWlmIChHRVRfU0VDX0ZST01fU0VHKHNiaS0+bmV4dF92aWN0aW1f
c2VnW0ZHX0dDXSkKPj09Cj4+Pj4+Pj4gKwkJCQkJCQkJCXNlY25vKQo+Pj4+Pj4+ICsJCQkJc2Jp
LT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdID0gTlVMTF9TRUdOTzsKPj4+Pj4+PiAgICAgCQl9Cj4+
Pj4+Pj4gICAgIAl9Cj4+Pj4+Pj4gICAgIHNraXBfZnJlZToKPj4+Pj4+PiAtLQo+Pj4+Pj4+IDIu
NDAuMQo+Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gQmVjYXVzZSB0aGUg
Y2FsbCBzdGFjayBpcyBkaWZmZXJlbnQsIEkgdGhpbmsgdGhhdCBpbiBvcmRlciB0bwo+Pj4+Pj4+
Pj4+IGhhbmRsZSBldmVyeXRoaW5nIGF0IG9uY2UsIHdlIG5lZWQgdG8gYWRkcmVzcyBpdCB3aXRo
aW4KPj4+Pj4+Pj4+PiBkb19nYXJiYWdlX2NvbGxlY3QsIG9yIG90aGVyd2lzZSBpbmNsdWRlIGl0
IG9uIGJvdGggc2lkZXMuCj4+Pj4+Pj4+Pj4gV2hhdCBkbyB5b3UgdGhpbms/Cj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+PiBbMzAxNDYuMzM3NDcxXVsgVDEzMDBdIEYyRlMtZnMgKGRtLTU0KTogSW5jb25z
aXN0ZW50IHNlZ21lbnQKPj4+Pj4+Pj4+PiAoNzA5NjEpIHR5cGUgWzAsIDFdIGluIFNTQSBhbmQg
U0lUIFszMDE0Ni4zNDYxNTFdWyBUMTMwMF0gQ2FsbAo+Pj4gdHJhY2U6Cj4+Pj4+Pj4+Pj4gWzMw
MTQ2LjM0NjE1Ml1bIFQxMzAwXSAgZHVtcF9iYWNrdHJhY2UrMHhlOC8weDEwYwo+Pj4+Pj4+Pj4+
IFszMDE0Ni4zNDYxNTddWyBUMTMwMF0gIHNob3dfc3RhY2srMHgxOC8weDI4IFszMDE0Ni4zNDYx
NThdWwo+Pj4+Pj4+Pj4+IFQxMzAwXSBkdW1wX3N0YWNrX2x2bCsweDUwLzB4NmMgWzMwMTQ2LjM0
NjE2MV1bIFQxMzAwXQo+Pj4+Pj4+Pj4+IGR1bXBfc3RhY2srMHgxOC8weDI4IFszMDE0Ni4zNDYx
NjJdWyBUMTMwMF0KPj4+Pj4+Pj4+PiBmMmZzX3N0b3BfY2hlY2twb2ludCsweDFjLzB4M2MgWzMw
MTQ2LjM0NjE2NV1bIFQxMzAwXQo+Pj4+Pj4+Pj4+IGRvX2dhcmJhZ2VfY29sbGVjdCsweDQxYy8w
eDI3MWMgWzMwMTQ2LjM0NjE2N11bIFQxMzAwXQo+Pj4+Pj4+Pj4+IGYyZnNfZ2MrMHgyN2MvMHg4
MjggWzMwMTQ2LjM0NjE2OF1bIFQxMzAwXQo+Pj4+Pj4+Pj4+IGdjX3RocmVhZF9mdW5jKzB4Mjkw
LzB4ODhjIFszMDE0Ni4zNDYxNjldWyBUMTMwMF0KPj4+Pj4+Pj4+PiBrdGhyZWFkKzB4MTFjLzB4
MTY0IFszMDE0Ni4zNDYxNzJdWyBUMTMwMF0KPj4+Pj4+Pj4+PiByZXRfZnJvbV9mb3JrKzB4MTAv
MHgyMAo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gc3RydWN0IGN1cnNlZ19pbmZvIDogMHhmZmZmZmY4
MDNmOTVlODAwIHsKPj4+Pj4+Pj4+PiAJc2Vnbm8gICAgICAgIDogMHgxMTUzMSA6IDcwOTYxCj4+
Pj4+Pj4+Pj4gfQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gc3RydWN0IGYyZnNfc2JfaW5mbyA6IDB4
ZmZmZmZmODgxMWQxMjAwMCB7Cj4+Pj4+Pj4+Pj4gCW5leHRfdmljdGltX3NlZ1swXSA6IDB4MTE1
MzEgOiA3MDk2MSB9Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI1MDMyNTA4MDY0Ni4zMjkxOQo+Pj4+
Pj4+Pj4+PiA0Nwo+Pj4+Pj4+Pj4+PiAtMgo+Pj4+Pj4+Pj4+PiAtCj4+Pj4+Pj4+Pj4+IGNoYW9A
a2VybmVsLm9yZwo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9oYW4gSm91bmcgPHlvaGFu
LmpvdW5nQHNrLmNvbT4KPj4+Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4+Pj4gICAgIGZzL2YyZnMv
Z2MuYyB8IDQgKysrKwo+Pj4+Pj4+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5j
IGIvZnMvZjJmcy9nYy5jIGluZGV4Cj4+Pj4+Pj4+Pj4+PiAyYjhmOTIzOWJlZGUuLjRiNWQxOGUz
OTVlYiAxMDA2NDQKPj4+Pj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+Pj4+Pj4+Pj4+Pj4g
KysrIGIvZnMvZjJmcy9nYy5jCj4+Pj4+Pj4+Pj4+PiBAQCAtMTkyNiw2ICsxOTI2LDEwIEBAIGlu
dCBmMmZzX2djKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4+Pj4+Pj4+IHN0cnVjdAo+
Pj4+Pj4+Pj4+PiBmMmZzX2djX2NvbnRyb2wgKmdjX2NvbnRyb2wpCj4+Pj4+Pj4+Pj4+PiAgICAg
CQlnb3RvIHN0b3A7Cj4+Pj4+Pj4+Pj4+PiAgICAgCX0KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
PiArCWlmIChfX2lzX2xhcmdlX3NlY3Rpb24oc2JpKSAmJgo+Pj4+Pj4+Pj4+Pj4gKwkJCUlTX0NV
UlNFQyhzYmksIEdFVF9TRUNfRlJPTV9TRUcoc2JpLCBzZWdubykpKQo+Pj4+Pj4+Pj4+Pj4gKwkJ
Z290byBzdG9wOwo+Pj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+Pj4gICAgIAlzZWdfZnJlZWQgPSBk
b19nYXJiYWdlX2NvbGxlY3Qoc2JpLCBzZWdubywgJmdjX2xpc3QsCj5nY190eXBlLAo+Pj4+Pj4+
Pj4+Pj4gICAgIAkJCQlnY19jb250cm9sLT5zaG91bGRfbWlncmF0ZV9ibG9ja3MsCj4+Pj4+Pj4+
Pj4+PiAgICAgCQkJCWdjX2NvbnRyb2wtPm9uZV90aW1lKTsKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+
Pj4+Pj4KPj4+PgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
