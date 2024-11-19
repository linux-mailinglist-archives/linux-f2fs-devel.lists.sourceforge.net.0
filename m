Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EA29D218A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Nov 2024 09:26:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDJZL-0008Qw-GM;
	Tue, 19 Nov 2024 08:26:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1tDJZK-0008Ql-J7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 08:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8F/f1JVuG1/4L3xoA/BuZmrA79fjSAEhXH9BA0nKX8E=; b=fAVtdctm1f1CaCk90uvDBMvn9p
 E/fjiAlRn+irdKBDPf4t59yB0eSi0lSsfBJr5os8RbzU3j6P88jdiZ1IgdMU8ukvVflSwLm2NHhdz
 phY/+ZbaIHYHUwPETAsv5ZwU7Jx58NVYvcUu7nzcad1lrUsNoEG1L9HCJfzLchDc+lNc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8F/f1JVuG1/4L3xoA/BuZmrA79fjSAEhXH9BA0nKX8E=; b=Oyd5XWKrmDw9JKXoQi/izNlHcY
 dvcxEjPEoqDWHHM7CXC4kicP2NM65gb2OHUKb8JV5k0zhYONdd71uIUDlAavv42NlQHje0SujbF4B
 peL/gGpkZRsebBYwyq8974UqLFhrNQWwU/Wc+jdQEulh5SOi/oIIK89Umfb9/ODDyeks=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tDJZJ-0002O5-Fe for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 08:26:42 +0000
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3824a646667so204204f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Nov 2024 00:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732004790; x=1732609590; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8F/f1JVuG1/4L3xoA/BuZmrA79fjSAEhXH9BA0nKX8E=;
 b=EvrWuJm3I9sS9QtXmrn8vKoFmS2cKT5EHFzFWWvsd3WF90p7N9TwsvQLse/4hE8VZ5
 23sjI7hE7yXVNxeDuKTetSM0DIyUVoYRvrY5U6nsU6Z3W3gjZqVK4NYaGmNHC5Cv+/93
 mJfarGUs2UAgFJqtBGZWLjQ6kQicW+2ZDvKHprW/a1EO9Yr/ZGxrl4ssXzZrQ2TsWVjI
 kFYqfuIEMoZmaXQQY9I0DS6Q/K8SZEHFf0uZf9PeBnkFBpI23ikLOV0/MiyErp70E7Og
 p1wP59bL3F4PZA9Kkjn+KeDzkm6PdXr9v+uNqol4nPPBBXbCnY3JQZlAI2rdzElG+4hc
 J3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732004790; x=1732609590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8F/f1JVuG1/4L3xoA/BuZmrA79fjSAEhXH9BA0nKX8E=;
 b=I9F2xhra2hb1mdarKYU2BNSQbDXwHAuJHEsM8mK5pAW5AnZ4V8z9OnI52eJgL0WIqk
 w6q2z57t7rp5LwIozS8vXjP705bH5cFE1XveDBg3HjbuUjztkCNHm7hZrMHH+nFzbd+4
 7vd1TEIt/uF6PUqei+97/vYiqPe5YTEICBQYzKNVzXS0WdBmsWBJwFlH8bWlle1PtAVG
 ms4rIHiODFyuXNerPnGdDrGWab7v29K6+DVIiCDo89WSSr/GldaQJYpf0fNM69H7jv9h
 F4d2fWzPCdMRUUh6l0XBszHSYOqMeKPtY/YRsPIlR/kN8ZMmHGSNmGsqY3cMO20rMVLA
 ulZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUodd9cUcFprCbHYnp+gE4ycz8t2ORJH/96xh2oRfbsVmuA6N+QADQPqef1swZ6T5AWfMBnLa3dNqs6+qp2R8Dp@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxsGE2Dq3qYMF4EOh61ZIjQue0tLGCT0DCcm1foPsAl0t45+JRY
 FkPckDhpCOW2wvgHl8bOx+/PIQYLYawpvlzVC0pbA5Y+9DdvALjYGl5nAB9Hn5dfs8NJf6euDZs
 0BBsnjl2JOw8V6SyqT6RYX6drVbs8WdvQ
X-Google-Smtp-Source: AGHT+IFzSjc9vFJGGEdMyChIRwyrY50Xv9jtOnG9bmyOyAJKGCmdRAeb3y9enjfoi3BCUpLNAGyZ5JiN0qnwiQtBD+8=
X-Received: by 2002:a05:6000:400b:b0:382:4538:c0d with SMTP id
 ffacd0b85a97d-38245380e2bmr2127655f8f.2.1732004789635; Tue, 19 Nov 2024
 00:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20241112110627.1314632-1-xiuhong.wang@unisoc.com>
 <fb436fdb-a4eb-49cc-a730-354611e88b21@kernel.org>
 <CAOsHCa1t+LeeAG2PDJ0BfYtoh_+CUmLjZcp1+dGZWR5PPfmFSQ@mail.gmail.com>
 <5b0c17da-f1e1-490d-a560-3312bc8c3247@kernel.org>
In-Reply-To: <5b0c17da-f1e1-490d-a560-3312bc8c3247@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 19 Nov 2024 16:26:18 +0800
Message-ID: <CAHJ8P3+dqhsNOy6-jvPaazSSOk7V9pEkQmamE48oLgGK1ORHfg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月19日周二 15:50写道： > > On 2024/11/19
    14:46, Xiuhong Wang wrote: > > Chao Yu 于2024年11月19日周二 14:05写道：
    > >> > >> On 2024/11/12 19:06, Xiuhong Wang wro [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.47 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.221.47 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.47 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1tDJZJ-0002O5-Fe
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix to avoid long time to shrink
 extent cache
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
Cc: Xiuhong Wang <xiuhong.wang@unisoc.com>, ke.wang@unisoc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Xiuhong Wang <xiuhong.wang.cn@gmail.com>, jaegeuk@kernel.org,
 hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIgxOeaXpeWRqOS6jCAxNTo1
MOWGmemBk++8mgo+Cj4gT24gMjAyNC8xMS8xOSAxNDo0NiwgWGl1aG9uZyBXYW5nIHdyb3RlOgo+
ID4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIgxOeaXpeWRqOS6jCAx
NDowNeWGmemBk++8mgo+ID4+Cj4gPj4gT24gMjAyNC8xMS8xMiAxOTowNiwgWGl1aG9uZyBXYW5n
IHdyb3RlOgo+ID4+PiBXZSBlbmNvdW50ZXJlZCBhIHN5c3RlbSBoYW5nIHByb2JsZW0gYmFzZWQg
b24gdGhlIGZvbGxvd2luZwo+ID4+PiBleHBlcmltZW50Ogo+ID4+PiBUaGVyZSBhcmUgMTcgcHJv
Y2Vzc2VzLCA4IG9mIHdoaWNoIGRvIDRrIGRhdGEgcmVhZCwgd3JpdGUgYW5kCj4gPj4+IGNvbXBh
cmUgdGVzdHMsIGFuZCA4IGRvIDY0ayByZWFkLCB3cml0ZSBhbmQgY29tcGFyZSB0ZXN0cy4gRWFj
aAo+ID4+PiB0aHJlYWQgd3JpdGVzIGEgMjU2TSBmaWxlLCBhbmQgYW5vdGhlciB0aHJlYWQgd3Jp
dGVzIGEgbGFyZ2UgZmlsZQo+ID4+PiB0byA4MCUgb2YgdGhlIGRpc2ssIGFuZCB0aGVuIGtlZXBz
IGRvaW5nIHJlYWQgb3BlcmF0aW9ucywgYWxsIG9mCj4gPj4+IHdoaWNoIGFyZSBkaXJlY3Qgb3Bl
cmF0aW9ucy4gVGhpcyB3aWxsIGNhdXNlIHRoZSBsYXJnZSBmaWxlIHRvIGJlCj4gPj4+IGZpbGxl
ZCB0byA4MCUgb2YgdGhlIGRpc2sgdG8gYmUgc2V2ZXJlbHkgZnJhZ21lbnRlZC4gT24gYSA1MTJH
Qgo+ID4+PiBkZXZpY2UsIHRoaXMgbGFyZ2UgZmlsZSBtYXkgZ2VuZXJhdGUgYSBodWdlIHpvbWJp
ZSBleHRlbnQgdHJlZS4KPiA+Pj4KPiA+Pj4gV2hlbiBzeXN0ZW0gc2h1dHRpbmcgZG93biwgdGhl
IGluaXQgcHJvY2VzcyBuZWVkcyB0byB3YWl0IGZvciB0aGUKPiA+Pj4gd3JpdGViYWNrIHByb2Nl
c3MsIGFuZCB0aGUgd3JpdGViYWNrIHByb2Nlc3MgbWF5IGVuY291bnRlciB0aGUKPiA+Pj4gc2l0
dWF0aW9uIHdoZXJlIHRoZSBSRUFEX0VYVEVOVF9DQUNIRSBzcGFjZSBpcyBpbnN1ZmZpY2llbnQg
YW5kCj4gPj4+IG5lZWRzIHRvIGZyZWUgdGhlIHpvbWJpZSBleHRlbnQgdHJlZS4gVGhlIGV4dGVu
dCB0cmVlIGhhcyBhIGxhcmdlCj4gPj4+IG51bWJlciBvZiBleHRlbnQgbm9kZXMsIGl0IHdpbGwg
YSBsb25nIGZyZWUgdGltZSB0byBmcmVlLCB3aGljaAo+ID4+PiB0cmlnZ2VycyBzeXN0ZW0gaGFu
Zy4KPiA+PiAgID4gPiBUaGUgc3RhY2sgd2hlbiB0aGUgcHJvYmxlbSBvY2N1cnMgaXMgYXMgZm9s
bG93czoKPiA+Pj4gY3Jhc2hfYXJtNjQ+IGJ0IDEKPiA+Pj4gUElEOiAxICAgICAgICBUQVNLOiBm
ZmZmZmY4MDgwMWE5MjAwICBDUFU6IDEgICAgQ09NTUFORDogImluaXQiCj4gPj4+ICAgICMwIFtm
ZmZmZmZjMDA4MDZiOWEwXSBfX3N3aXRjaF90byBhdCBmZmZmZmZjMDA4MTA3MTFjCj4gPj4+ICAg
ICMxIFtmZmZmZmZjMDA4MDZiYTAwXSBfX3NjaGVkdWxlIGF0IGZmZmZmZmMwMDk3YzFjNGMKPiA+
Pj4gICAgIzIgW2ZmZmZmZmMwMDgwNmJhNjBdIHNjaGVkdWxlIGF0IGZmZmZmZmMwMDk3YzIzMDgK
PiA+Pj4gICAgIzMgW2ZmZmZmZmMwMDgwNmJhYjBdIHdiX3dhaXRfZm9yX2NvbXBsZXRpb24gYXQg
ZmZmZmZmYzAwODYzMjBkNAo+ID4+PiAgICAjNCBbZmZmZmZmYzAwODA2YmIyMF0gd3JpdGViYWNr
X2lub2Rlc19zYiBhdCBmZmZmZmZjMDA4NjM3MTljCj4gPj4+ICAgICM1IFtmZmZmZmZjMDA4MDZi
YmEwXSBzeW5jX2ZpbGVzeXN0ZW0gYXQgZmZmZmZmYzAwODYzYzk4Ywo+ID4+PiAgICAjNiBbZmZm
ZmZmYzAwODA2YmJjMF0gZjJmc19xdW90YV9vZmZfdW1vdW50IGF0IGZmZmZmZmMwMDg4NmZjNjAK
PiA+Pj4gICAgIzcgW2ZmZmZmZmMwMDgwNmJjMjBdIGYyZnNfcHV0X3N1cGVyIGF0IGZmZmZmZmMw
MDg4NzE1YjQKPiA+Pj4gICAgIzggW2ZmZmZmZmMwMDgwNmJjNjBdIGdlbmVyaWNfc2h1dGRvd25f
c3VwZXIgYXQgZmZmZmZmYzAwODVjZDYxYwo+ID4+PiAgICAjOSBbZmZmZmZmYzAwODA2YmNkMF0g
a2lsbF9mMmZzX3N1cGVyIGF0IGZmZmZmZmMwMDg4NmIzZGMKPiA+Pj4KPiA+Pj4gY3Jhc2hfYXJt
NjQ+IGJ0IDE0OTk3Cj4gPj4+IFBJRDogMTQ5OTcgICAgVEFTSzogZmZmZmZmODExOWQ4MjQwMCAg
Q1BVOiAzICAgIENPTU1BTkQ6ICJrd29ya2VyL3UxNjowIgo+ID4+PiAgICAjMCBbZmZmZmZmYzAx
OWY4Yjc2MF0gX19kZXRhY2hfZXh0ZW50X25vZGUgYXQgZmZmZmZmYzAwODhkNWE1OAo+ID4+PiAg
ICAjMSBbZmZmZmZmYzAxOWY4Yjc5MF0gX19yZWxlYXNlX2V4dGVudF9ub2RlIGF0IGZmZmZmZmMw
MDg4ZDU5NzAKPiA+Pj4gICAgIzIgW2ZmZmZmZmMwMTlmOGI4MTBdIGYyZnNfc2hyaW5rX2V4dGVu
dF90cmVlIGF0IGZmZmZmZmMwMDg4ZDVjN2MKPiA+Pj4gICAgIzMgW2ZmZmZmZmMwMTlmOGI4YTBd
IGYyZnNfYmFsYW5jZV9mc19iZyBhdCBmZmZmZmZjMDA4OGMxMDljCj4gPj4+ICAgICM0IFtmZmZm
ZmZjMDE5ZjhiOTEwXSBmMmZzX3dyaXRlX25vZGVfcGFnZXMgYXQgZmZmZmZmYzAwODhiZDRkOAo+
ID4+PiAgICAjNSBbZmZmZmZmYzAxOWY4Yjk5MF0gZG9fd3JpdGVwYWdlcyBhdCBmZmZmZmZjMDA4
NGEwYjVjCj4gPj4+ICAgICM2IFtmZmZmZmZjMDE5ZjhiOWYwXSBfX3dyaXRlYmFja19zaW5nbGVf
aW5vZGUgYXQgZmZmZmZmYzAwODYyZWUyOAo+ID4+PiAgICAjNyBbZmZmZmZmYzAxOWY4YmIzMF0g
d3JpdGViYWNrX3NiX2lub2RlcyBhdCBmZmZmZmZjMDA4NjM1OGMwCj4gPj4+ICAgICM4IFtmZmZm
ZmZjMDE5ZjhiYzEwXSB3Yl93cml0ZWJhY2sgYXQgZmZmZmZmYzAwODYzNjJkYwo+ID4+PiAgICAj
OSBbZmZmZmZmYzAxOWY4YmNjMF0gd2JfZG9fd3JpdGViYWNrIGF0IGZmZmZmZmMwMDg2MzQ5MTAK
PiA+Pj4KPiA+Pj4gUHJvY2VzcyAxNDk5NyByYW4gZm9yIHRvbyBsb25nIGFuZCBjYXVzZWQgdGhl
IHN5c3RlbSBoYW5nLgo+ID4+Pgo+ID4+PiBBdCB0aGlzIHRpbWUsIHRoZXJlIGFyZSBzdGlsbCAx
MDg2OTExIGV4dGVudCBub2RlcyBpbiB0aGlzIHpvbWJpZQo+ID4+PiBleHRlbnQgdHJlZSB0aGF0
IG5lZWQgdG8gYmUgY2xlYW5lZCB1cC4KPiA+Pj4KPiA+Pj4gY3Jhc2hfYXJtNjRfc3ByZF92OC4w
LjMrKz4gZXh0ZW50X3RyZWUubm9kZV9jbnQgZmZmZmZmODA4OTZjYzUwMAo+ID4+PiAgICAgbm9k
ZV9jbnQgPSB7Cj4gPj4+ICAgICAgIGNvdW50ZXIgPSAxMDg2OTExCj4gPj4+ICAgICB9LAo+ID4+
Pgo+ID4+PiBUaGUgcm9vdCBjYXVzZSBvZiB0aGlzIHByb2JsZW0gaXMgdGhhdCB3aGVuIHRoZSBm
MmZzX2JhbGFuY2VfZnMKPiA+Pj4gZnVuY3Rpb24gaXMgY2FsbGVkIGluIHRoZSB3cml0ZSBwcm9j
ZXNzLCBpdCB3aWxsIGRldGVybWluZQo+ID4+PiB3aGV0aGVyIHRvIGNhbGwgZjJmc19iYWxhbmNl
X2ZzX2JnLCBidXQgaXQgaXMgZGlmZmljdWx0IHRvCj4gPj4+IG1lZXQgdGhlIGNvbmRpdGlvbiBv
ZiBleGNlc3NfY2FjaGVkX25hdHMuIFdoZW4gdGhlCj4gPj4+IGYyZnNfc2hyaW5rX2V4dGVudF90
cmVlIGZ1bmN0aW9uIGlzIGNhbGxlZCB0byBmcmVlIGR1cmluZwo+ID4+PiBmMmZzX3dyaXRlX25v
ZGVfcGFnZXMsIHRoZXJlIGFyZSB0b28gbWFueSBleHRlbnQgbm9kZXMgb24gdGhlCj4gPj4+IGV4
dGVudCB0cmVlLCB3aGljaCBjYXVzZXMgYSBsb29wIGFuZCBjYXVzZXMgYSBzeXN0ZW0gaGFuZy4K
PiA+Pj4KPiA+Pj4gVG8gc29sdmUgdGhpcyBwcm9ibGVtLCB3aGVuIGNhbGxpbmcgZjJmc19iYWxh
bmNlX2ZzLCBjaGVjayB3aGV0aGVyCj4gPj4+IHRoZSBleHRlbnQgY2FjaGUgaXMgc3VmZmljaWVu
dC4gSWYgbm90LCByZWxlYXNlIHRoZSB6b21iaWUgZXh0ZW50Cj4gPj4+IHRyZWUuCj4gPj4+Cj4g
Pj4+IFNpZ25lZC1vZmYtYnk6IFhpdWhvbmcgV2FuZyA8eGl1aG9uZy53YW5nQHVuaXNvYy5jb20+
Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4K
PiA+Pj4gLS0tCj4gPj4+IFRlc3QgdGhlIHByb2JsZW0gd2l0aCB0aGUgdGVtcG9yYXJ5IHZlcnNp
b25zOgo+ID4+PiBwYXRjaCBkaWQgbm90IHJlcHJvZHVjZSB0aGUgcHJvYmxlbSwgdGhlIHBhdGNo
IGlzIGFzIGZvbGxvd3M6Cj4gPj4+IEBAIC00MTUsNyArNDE1LDcgQEAgdm9pZCBmMmZzX2JhbGFu
Y2VfZnMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBib29sIG5lZWQpCj4gPj4+ICAgICAgICAg
ICAgICAgICAgIGYyZnNfc3RvcF9jaGVja3BvaW50KHNiaSwgZmFsc2UsIFNUT1BfQ1BfUkVBU09O
X0ZBVUxUX0lOSkVDVCk7Cj4gPj4+Cj4gPj4+ICAgICAgICAgICAvKiBiYWxhbmNlX2ZzX2JnIGlz
IGFibGUgdG8gYmUgcGVuZGluZyAqLwo+ID4+PiAtICAgICAgIGlmIChuZWVkICYmIGV4Y2Vzc19j
YWNoZWRfbmF0cyhzYmkpKQo+ID4+PiArICAgICAgIGlmIChuZWVkKQo+ID4+PiAgICAgICAgICAg
ICAgICAgICBmMmZzX2JhbGFuY2VfZnNfYmcoc2JpLCBmYWxzZSk7Cj4gPj4+Cj4gPj4+IC0tLQo+
ID4+PiAgICBmcy9mMmZzL3NlZ21lbnQuYyB8IDQgKysrLQo+ID4+PiAgICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gPj4+IGluZGV4IDE3NjYy
NTQyNzlkMi4uMzkwYmVjMTc3NTY3IDEwMDY0NAo+ID4+PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQu
Ywo+ID4+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+ID4+PiBAQCAtNDE1LDcgKzQxNSw5IEBA
IHZvaWQgZjJmc19iYWxhbmNlX2ZzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBuZWVk
KQo+ID4+PiAgICAgICAgICAgICAgICBmMmZzX3N0b3BfY2hlY2twb2ludChzYmksIGZhbHNlLCBT
VE9QX0NQX1JFQVNPTl9GQVVMVF9JTkpFQ1QpOwo+ID4+Pgo+ID4+PiAgICAgICAgLyogYmFsYW5j
ZV9mc19iZyBpcyBhYmxlIHRvIGJlIHBlbmRpbmcgKi8KPiA+Pj4gLSAgICAgaWYgKG5lZWQgJiYg
ZXhjZXNzX2NhY2hlZF9uYXRzKHNiaSkpCj4gPj4+ICsgICAgIGlmIChuZWVkICYmIChleGNlc3Nf
Y2FjaGVkX25hdHMoc2JpKSB8fAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgIWYyZnNfYXZh
aWxhYmxlX2ZyZWVfbWVtb3J5KHNiaSwgUkVBRF9FWFRFTlRfQ0FDSEUpIHx8Cj4gPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAhZjJmc19hdmFpbGFibGVfZnJlZV9tZW1vcnkoc2JpLCBBR0VfRVhU
RU5UX0NBQ0hFKSkpCj4gPj4KPiA+PiBIaSwKPiA+Pgo+ID4+IEkgZG91YnQgaWYgdGhlcmUgaXMg
bm8gZW5vdWdoIG1lbW9yeSwgd2UgbWF5IHN0aWxsIHJ1biBpbnRvCj4gPj4gZjJmc19zaHJpbmtf
ZXh0ZW50X3RyZWUoKSBhbmQgc3VmZmVyIHN1Y2ggbG9uZyB0aW1lIGRlbGF5Lgo+ID4+Cj4gPj4g
U28sIGNhbiB3ZSBqdXN0IGxldCBfX2ZyZWVfZXh0ZW50X3RyZWUoKSBicmVhayB0aGUgbG9vcCBv
bmNlIHdlIGhhdmUKPiA+PiByZWxlYXNlZCBlbnRyaWVzIHcvIHRhcmdldCBudW1iZXI/IHNvbWV0
aGluZyBsaWtlIHRoaXM6Cj4gPj4KPiA+PiAtLS0KPiA+PiAgICBmcy9mMmZzL2V4dGVudF9jYWNo
ZS5jIHwgMTUgKysrKysrKysrKy0tLS0tCj4gPj4gICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9l
eHRlbnRfY2FjaGUuYyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPiA+PiBpbmRleCAwMTljMWY3
YjdmYTUuLjM4YzcxYzFjNGZiNyAxMDA2NDQKPiA+PiAtLS0gYS9mcy9mMmZzL2V4dGVudF9jYWNo
ZS5jCj4gPj4gKysrIGIvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+ID4+IEBAIC0zNzksMTEgKzM3
OSwxMiBAQCBzdGF0aWMgc3RydWN0IGV4dGVudF90cmVlICpfX2dyYWJfZXh0ZW50X3RyZWUoc3Ry
dWN0IGlub2RlICppbm9kZSwKPiA+PiAgICB9Cj4gPj4KPiA+PiAgICBzdGF0aWMgdW5zaWduZWQg
aW50IF9fZnJlZV9leHRlbnRfdHJlZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBleHRlbnRfdHJlZSAq
ZXQpCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZXh0ZW50X3Ry
ZWUgKmV0LCB1bnNpZ25lZCBpbnQgbnJfc2hyaW5rKQo+ID4+ICAgIHsKPiA+PiAgICAgICAgICBz
dHJ1Y3QgcmJfbm9kZSAqbm9kZSwgKm5leHQ7Cj4gPj4gICAgICAgICAgc3RydWN0IGV4dGVudF9u
b2RlICplbjsKPiA+PiAgICAgICAgICB1bnNpZ25lZCBpbnQgY291bnQgPSBhdG9taWNfcmVhZCgm
ZXQtPm5vZGVfY250KTsKPiA+PiArICAgICAgIHVuc2lnbmVkIGludCBpID0gMDsKPiA+Pgo+ID4+
ICAgICAgICAgIG5vZGUgPSByYl9maXJzdF9jYWNoZWQoJmV0LT5yb290KTsKPiA+PiAgICAgICAg
ICB3aGlsZSAobm9kZSkgewo+ID4+IEBAIC0zOTEsNiArMzkyLDkgQEAgc3RhdGljIHVuc2lnbmVk
IGludCBfX2ZyZWVfZXh0ZW50X3RyZWUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4+ICAg
ICAgICAgICAgICAgICAgZW4gPSByYl9lbnRyeShub2RlLCBzdHJ1Y3QgZXh0ZW50X25vZGUsIHJi
X25vZGUpOwo+ID4+ICAgICAgICAgICAgICAgICAgX19yZWxlYXNlX2V4dGVudF9ub2RlKHNiaSwg
ZXQsIGVuKTsKPiA+PiAgICAgICAgICAgICAgICAgIG5vZGUgPSBuZXh0Owo+ID4+ICsKPiA+PiAr
ICAgICAgICAgICAgICAgaWYgKG5yX3NocmluayAmJiArK2kgPj0gbnJfc2hyaW5rKQo+ID4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4+ICAgICAgICAgIH0KPiA+Pgo+ID4+ICAg
ICAgICAgIHJldHVybiBjb3VudCAtIGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpOwo+ID4+IEBA
IC03NjEsNyArNzY1LDcgQEAgc3RhdGljIHZvaWQgX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2Uo
c3RydWN0IGlub2RlICppbm9kZSwKPiA+PiAgICAgICAgICB9Cj4gPj4KPiA+PiAgICAgICAgICBp
ZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX05PX0VYVEVOVCkpCj4gPj4gLSAgICAgICAg
ICAgICAgIF9fZnJlZV9leHRlbnRfdHJlZShzYmksIGV0KTsKPiA+PiArICAgICAgICAgICAgICAg
X19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQsIDApOwo+ID4+Cj4gPj4gICAgICAgICAgaWYgKGV0
LT5sYXJnZXN0X3VwZGF0ZWQpIHsKPiA+PiAgICAgICAgICAgICAgICAgIGV0LT5sYXJnZXN0X3Vw
ZGF0ZWQgPSBmYWxzZTsKPiA+PiBAQCAtOTQyLDcgKzk0Niw4IEBAIHN0YXRpYyB1bnNpZ25lZCBp
bnQgX19zaHJpbmtfZXh0ZW50X3RyZWUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgbnJf
c2hyaW5rCj4gPj4gICAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGV0LCBuZXh0LCAm
ZXRpLT56b21iaWVfbGlzdCwgbGlzdCkgewo+ID4+ICAgICAgICAgICAgICAgICAgaWYgKGF0b21p
Y19yZWFkKCZldC0+bm9kZV9jbnQpKSB7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHdy
aXRlX2xvY2soJmV0LT5sb2NrKTsKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICBub2RlX2Nu
dCArPSBfX2ZyZWVfZXh0ZW50X3RyZWUoc2JpLCBldCk7Cj4gPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgbm9kZV9jbnQgKz0gX19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQsCj4gPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5yX3NocmluayAtIG5vZGVfY250IC0g
dHJlZV9jbnQpOwo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICB3cml0ZV91bmxvY2soJmV0
LT5sb2NrKTsKPiA+PiAgICAgICAgICAgICAgICAgIH0KPiA+PiAgICAgICAgICAgICAgICAgIGYy
ZnNfYnVnX29uKHNiaSwgYXRvbWljX3JlYWQoJmV0LT5ub2RlX2NudCkpOwo+ID4+IEBAIC0xMDk1
LDcgKzExMDAsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IF9fZGVzdHJveV9leHRlbnRfbm9kZShz
dHJ1Y3QgaW5vZGUgKmlub2RlLAo+ID4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPj4K
PiA+PiAgICAgICAgICB3cml0ZV9sb2NrKCZldC0+bG9jayk7Cj4gPj4gLSAgICAgICBub2RlX2Nu
dCA9IF9fZnJlZV9leHRlbnRfdHJlZShzYmksIGV0KTsKPiA+PiArICAgICAgIG5vZGVfY250ID0g
X19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQsIDApOwo+ID4+ICAgICAgICAgIHdyaXRlX3VubG9j
aygmZXQtPmxvY2spOwo+ID4+Cj4gPj4gICAgICAgICAgcmV0dXJuIG5vZGVfY250Owo+ID4+IEBA
IC0xMTE3LDcgKzExMjIsNyBAQCBzdGF0aWMgdm9pZCBfX2Ryb3BfZXh0ZW50X3RyZWUoc3RydWN0
IGlub2RlICppbm9kZSwgZW51bSBleHRlbnRfdHlwZSB0eXBlKQo+ID4+ICAgICAgICAgICAgICAg
ICAgcmV0dXJuOwo+ID4+Cj4gPj4gICAgICAgICAgd3JpdGVfbG9jaygmZXQtPmxvY2spOwo+ID4+
IC0gICAgICAgX19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQpOwo+ID4+ICsgICAgICAgX19mcmVl
X2V4dGVudF90cmVlKHNiaSwgZXQsIDApOwo+ID4+ICAgICAgICAgIGlmICh0eXBlID09IEVYX1JF
QUQpIHsKPiA+PiAgICAgICAgICAgICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9OT19F
WFRFTlQpOwo+ID4+ICAgICAgICAgICAgICAgICAgaWYgKGV0LT5sYXJnZXN0Lmxlbikgewo+ID4+
IC0tCj4gPj4gMi40MC4xCj4gPj4KPiA+PiBUaGFua3MsCj4gPj4KPiA+Pj4gICAgICAgICAgICAg
ICAgZjJmc19iYWxhbmNlX2ZzX2JnKHNiaSwgZmFsc2UpOwo+ID4+Pgo+ID4+PiAgICAgICAgaWYg
KCFmMmZzX2lzX2NoZWNrcG9pbnRfcmVhZHkoc2JpKSkKPiA+Pgo+ID4KPiA+Cj4gPiBIaSBjaGFv
LAo+ID4KPiA+IFdlIGhhdmUgYWxzbyBjb25zaWRlcmVkIHRoaXMgYXBwcm9hY2gsIGJ1dCB0aGUg
cHJvYmxlbSBzdGlsbCBvY2N1cnMKPiA+IGFmdGVyIHJldGVzdGluZy4KPiA+IDEuIFRoZSBwcm9i
bGVtIHN0aWxsIG9jY3VycyBpbiB0aGUgZm9sbG93aW5nIGNhbGwgb2YgdGhlIHVubW91bnQgZGF0
YSBwcm9jZXNzLgo+ID4gZjJmc19wdXRfc3VwZXIgLT4gZjJmc19sZWF2ZV9zaHJpbmtlcgo+Cj4g
WWVzLCBJIGd1ZXNzIHdlIG5lZWQgdG8gZml4IHRoaXMgcGF0aCBhcyB3ZWxsLCBob3dldmVyLCB5
b3VyIHBhdGNoIGRpZG4ndAo+IGNvdmVyIHRoaXMgcGF0aCBhcyB3ZWxsLCBhbSBJIG1pc3Npbmcg
c29tZXRoaW5nPwpEZWFyIENoYW8sClRoaXMgcGF0Y2ggdmVyc2lvbiBhaW0gIHRvIHNocmluayBl
eHRlbnQgY2FjaGUgYXMgZWFybHkgYXMgcG9zc2libGUgb24KdGhlICAiYWxsIHdyaXRlIHBhdGgi
CmJ5ICJ3cml0ZSBhY3Rpb24iIC0+IGYyZnNfYmFsYW5jZV9mcyAtPiBmMmZzX2JhbGFuY2VfZnNf
YmcKQXMgdGhlIGNvbW1lbnQgLCB0aGUgImV4Y2Vzc19jYWNoZWRfbmF0cyIgaXMgZGlmZmljdWx0
IHRvIGFjaGlldmUgaW4KdGhpcyBzY2VuYXJpbywgYW5kCnRyaWdnZXIgdGhlIGlzc3VlIGluIHBh
dGggZjJmc193cml0ZV9ub2RlX3BhZ2VzLT5mMmZzX2JhbGFuY2VfZnNfYmcoaXMKY2FsbGVkIGRp
cmVjdGx5IGhlcmUpLgpBdCB0aGF0IHRpbWUsIHRoZXJlIHdlcmUgYWxyZWFkeSBhIGxvdCBvZiBl
eHRlbnQgbm9kZSBjbnQuClRoYW5rcyEKPgo+ID4gMi4gV3JpdGluZyBiYWNrIHRoZSBpbm9kZSBp
biB0aGUgbm9ybWFsIHdyaXRlLWJhY2sgcHJvY2VzcyB3aWxsCj4gPiByZWxlYXNlIHRoZSBleHRl
bnQgY2FjaGUsIGFuZCB0aGUgcHJvYmxlbSBzdGlsbCBvY2N1cnMuIFRoZSBzdGFjayBpcwo+ID4g
YXMgZm9sbG93czoKPgo+IERpdHRvLAo+Cj4gVGhhbmtzLAo+Cj4gPiBbSCAxMDMwOTguOTc0MzU2
XSBjMiBbPGZmZmZmZmMwMDhhZWU4YTQ+XSAocmJfZXJhc2UrMHgyMDQvMHgzMzQpCj4gPiBbSCAx
MDMwOTguOTc0Mzg5XSBjMiBbPGZmZmZmZmMwMDg4ZjhmZDA+XSAoX19yZWxlYXNlX2V4dGVudF9u
b2RlKzB4YzgvMHgxNjgpCj4gPiBbSCAxMDMwOTguOTc0NDI1XSBjMiBbPGZmZmZmZmMwMDg4ZmFk
NzQ+XQo+ID4gKGYyZnNfdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKzB4NGEwLzB4NzI0KQo+ID4g
W0ggMTAzMDk4Ljk3NDQ1OV0gYzIgWzxmZmZmZmZjMDA4OGZhOGMwPl0gKGYyZnNfdXBkYXRlX2V4
dGVudF9jYWNoZSsweDE5Yy8weDFiMCkKPiA+IFtIIDEwMzA5OC45NzQ0OTVdIGMyIFs8ZmZmZmZm
YzAwODhlZGM3MD5dIChmMmZzX291dHBsYWNlX3dyaXRlX2RhdGErMHg3NC8weGYwKQo+ID4gW0gg
MTAzMDk4Ljk3NDUyNV0gYzIgWzxmZmZmZmZjMDA4OGNhODM0Pl0gKGYyZnNfZG9fd3JpdGVfZGF0
YV9wYWdlKzB4M2U0LzB4NmM4KQo+ID4gW0ggMTAzMDk4Ljk3NDU1Ml0gYzIgWzxmZmZmZmZjMDA4
OGNiMTUwPl0KPiA+IChmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UrMHg0NzgvMHhhYjApCj4g
PiBbSCAxMDMwOTguOTc0NTc0XSBjMiBbPGZmZmZmZmMwMDg4ZDBiZDA+XSAoZjJmc193cml0ZV9j
YWNoZV9wYWdlcysweDQ1NC8weGFhYykKPiA+IFtIIDEwMzA5OC45NzQ1OTZdIGMyIFs8ZmZmZmZm
YzAwODhkMDY5OD5dIChfX2YyZnNfd3JpdGVfZGF0YV9wYWdlcysweDQwYy8weDRmMCkKPiA+IFtI
IDEwMzA5OC45NzQ2MTddIGMyIFs8ZmZmZmZmYzAwODhjYzg2MD5dIChmMmZzX3dyaXRlX2RhdGFf
cGFnZXMrMHgzMC8weDQwKQo+ID4gW0ggMTAzMDk4Ljk3NDY0NV0gYzIgWzxmZmZmZmZjMDA4NGMw
ZTAwPl0gKGRvX3dyaXRlcGFnZXMrMHgxOGMvMHgzZTgpCj4gPiBbSCAxMDMwOTguOTc0Njc4XSBj
MiBbPGZmZmZmZmMwMDg2NTAzY2M+XSAoX193cml0ZWJhY2tfc2luZ2xlX2lub2RlKzB4NDgvMHg0
OTgpCj4gPiBbSCAxMDMwOTguOTc0NzIwXSBjMiBbPGZmZmZmZmMwMDg2NTYyYzg+XSAod3JpdGVi
YWNrX3NiX2lub2RlcysweDQ1NC8weDliMCkKPiA+IFtIIDEwMzA5OC45NzQ3NTRdIGMyIFs8ZmZm
ZmZmYzAwODY1NWRlOD5dIChfX3dyaXRlYmFja19pbm9kZXNfd2IrMHgxOTgvMHgyMjQpCj4gPiBb
SCAxMDMwOTguOTc0Nzg4XSBjMiBbPGZmZmZmZmMwMDg2NTZkMGM+XSAod2Jfd3JpdGViYWNrKzB4
MWMwLzB4Njk4KQo+ID4gW0ggMTAzMDk4Ljk3NDgxOV0gYzIgWzxmZmZmZmZjMDA4NjU1NjE0Pl0g
KHdiX2RvX3dyaXRlYmFjaysweDQyMC8weDU0YykKPiA+IFtIIDEwMzA5OC45NzQ4NTNdIGMyIFs8
ZmZmZmZmYzAwODY1NGY1MD5dICh3Yl93b3JrZm4rMHhlNC8weDM4OCkKPgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
