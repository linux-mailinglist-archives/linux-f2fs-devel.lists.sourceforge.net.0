Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD1F629164
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Nov 2022 06:11:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouoE3-0006tB-18;
	Tue, 15 Nov 2022 05:11:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jun.nie@linaro.org>) id 1ouoE1-0006t4-C6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 05:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wqQy12XFUgnRX9khT+cCXlW9/foyJ4blhF6LQ95A76o=; b=LKeVplajlPcyEyDxBpLMHX/sOR
 Ub6SggF01Wjo+eSAFcXCCOGDzJ9pgE4xJrvu5Pe9lVIZ5ReXtGS7Do3xBT6NTU/qAWvT2RQuKvl6f
 DCiEg+S7CAAanfGRY3l8Ql/WwaohGD54WOWlwDXtyrDf/AVTi8ZtCZk/zeYKpTNat9SY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wqQy12XFUgnRX9khT+cCXlW9/foyJ4blhF6LQ95A76o=; b=GjDeHgJqGFNOeVbkRrUrVS3gWv
 sGG0I8gqo7jCrYQr1whqNdDYwoZ5+e5VjaIdYl9mDPTcv8PWL2yCoDtzz+fPCHI9FidDnYdhjxYhS
 jqzRXpOm/bKS0R8+hQBdGZKuvYV9MoDX3X6t7STEzYLis0L9QcT9Pz+RqhxiUEuwRhWQ=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ouoDu-0004Vu-Jp for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 05:11:09 +0000
Received: by mail-ed1-f43.google.com with SMTP id f7so20297845edc.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Nov 2022 21:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqQy12XFUgnRX9khT+cCXlW9/foyJ4blhF6LQ95A76o=;
 b=ymIiSOwr+xJ3hkk1bsxngM5c4I/NcP7YEEPNxG3Y0tSJVubX1CM7f9DK23Umg9yJ44
 NiwO7ZJOb3I09eUX9A+4FyeXqRy1lKcInvlXti9nkJYn6sJFNcKAS5qLW60M3oDcIYln
 aa69ezSd+XqwdoyMTmViJHv2l4lwwlwGJW6ltlJhfqoYjmwRZZ7e+YKwNRsCuucO+rKK
 lJ6Aj4ldHwdR80NXKzch3WnPjDLkHB8XGE9A6eTCdHB54VXSkN+L7ROyKXlQ1plT+yz+
 4wu9JXdR1406uHMAza5i/VlOolSdxPILa6+9GE69yaSpFlawxywxnVkAm6iauQiEJ30w
 fc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wqQy12XFUgnRX9khT+cCXlW9/foyJ4blhF6LQ95A76o=;
 b=r4/4VDRZ5yxSrVRRtW3k73cqMoP6VhX57hCMdyElO57Swe6wqY/l5DqrTRrr/S68Vp
 Rt3B36n7jxcA6lrjIVKz7Iv+lZ8wqTT0GonsJqoVBt5lBD+/PFxdZugEWPaQA1CAku51
 mv3bzCBrNDSSWsA3Tb81fcQsvjDQt3ZdiltiqIUN3Zs0dscZqPcNIDVnHaC2BI73GWBQ
 je57q4oqBevf1C1LHxjr/cK5S0g3GsHiDA0MvXvLoYZCX104IlDaYJo1Y3A/oowXZE4Z
 qweLY1uky2oGVIpWE7fQSQJ5uwXqFVd4amy/KMKW2v80KNpLjCOk29TfNg+ZoIgWY7rA
 e4eA==
X-Gm-Message-State: ANoB5pk6YdLd5IgXjYDsVe1kRuwjR2pScU4HBBWbmnEqrA1fGHMC/wGI
 2wsNMxL+36KvyxEUHDbTciLKBUaEoGX3VLSGGxZEAwyQCtqjjUco
X-Google-Smtp-Source: AA0mqf7PGbhFEQTgl170EIMeU+SkqzjqGlEjJt4q3rDzWM60/551o2ctSv2MQPBxypSrc9BWQUwB4qKfc1ReUxnAXpg=
X-Received: by 2002:a19:7411:0:b0:4b1:215b:167d with SMTP id
 v17-20020a197411000000b004b1215b167dmr5423887lfe.558.1668487301857; Mon, 14
 Nov 2022 20:41:41 -0800 (PST)
MIME-Version: 1.0
References: <CABymUCNq9yqhAS0zxg+-gsCjj0GgTd=wmT7TjOcRz2TTew8zDA@mail.gmail.com>
 <697a57bd-8507-1477-0176-e840b2e2f809@kernel.org>
In-Reply-To: <697a57bd-8507-1477-0176-e840b2e2f809@kernel.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 15 Nov 2022 12:41:30 +0800
Message-ID: <CABymUCNd36Z6F3miBfSSeaXnyNT5OH_S1j6FBFM=aV_x3dfiug@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu <chao@kernel.org> 于2022年11月15日周二 00:02写道：
    > > On 2022/11/14 9:47, Jun Nie wrote: > > Hi Chao & Jaegeuk, > > > > There
    is a KASAN report[0] that shows invalid memory > > acces [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.43 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1ouoDu-0004Vu-Jp
Subject: Re: [f2fs-dev] [BUG REPORT] f2fs: use-after-free during garbage
 collection
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
Cc: netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, edumazet@google.com, kuba@kernel.org,
 Lee Jones <joneslee@google.com>, jaegeuk@kernel.org, pabeni@redhat.com,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDIy5bm0MTHmnIgxNeaXpeWRqOS6jCAwMDow
MuWGmemBk++8mgo+Cj4gT24gMjAyMi8xMS8xNCA5OjQ3LCBKdW4gTmllIHdyb3RlOgo+ID4gSGkg
IENoYW8gJiBKYWVnZXVrLAo+ID4KPiA+IFRoZXJlIGlzIGEgS0FTQU4gcmVwb3J0WzBdIHRoYXQg
c2hvd3MgaW52YWxpZCBtZW1vcnkKPiA+IGFjY2Vzcyh1c2UtYWZ0ZXItZnJlZSkgaW4gZjJmcyBn
YXJiYWdlIGNvbGxlY3Rpb24gcHJvY2VzcywgYW5kIHRoaXMKPiA+IGlzc3VlIGlzIGZpeGVkIGJ5
IGEgcmVjZW50IGYyZnMgcGF0Y2ggc2V0WzFdLiBUaGUgS0FTQU4gcmVwb3J0IGlzIGNhdXNlZAo+
ID4gYnkgYW4gYWJub3JtYWwgc3VtLT5vZnNfaW5fbm9kZSB2YWx1ZSAweGMzZjEgaW4gdGhlIGZp
cnN0IGNoZWNrLiBBbmQKPiA+IHRoZSBpbnZlc3RpZ2F0aW9uIGluZGljYXRlcyB0aGF0IHRoZSBm
MmZzX3N1bW1hcnlfYmxvY2sgYWRkcmVzcyByYW5nZQo+ID4gaXMgbm90IGZyb20gZjJmc19remFs
bG9jKCkgaW4gYnVpbGRfY3Vyc2VnKCkuIFRoZSBtZW1vcnkKPiA+IGFsbG9jYXRpb24vZnJlZSBo
YXBwZW5zIGluIG5vbi1mMmZzIHRocmVhZCwgc3VjaCBhcyBuZXR3b3JrLiBTbyBJCj4gPiBndWVz
cyB0aGUgZjJmcyBzdWJzeXN0ZW0gaXMgYWNjZXNzaW5nIG1lbW9yeSB0aGF0J3Mgbm90IGJlbG9u
ZyB0byBmMmZzCj4gPiBpbiBzb21lIGNhc2VzLiBXaXRoIHRoZSBiZWxvdyBjb21taXQgbWVyZ2Vk
IGludG8gbWFpbmxpbmUgcmVjZW50bHksCj4gPiB0aGlzICB1c2UtYWZ0ZXItZnJlZSBpc3N1ZSBk
aXNhcHBlYXJzLiBCdXQgdGhlcmUgaXMgYW5vdGhlciB0aHJlYWQKPiA+IGJsb2NrZWQgaXNzdWUg
YXMgYmVsb3cuIFRoZSBwYXRjaCBjNmFkN2ZkMTY2NTcgY2hlY2sgdGhlIHZhbGlkCj4gPiBvZnNf
aW5fbm9kZSBhbmQgc3RvcCBmdXJ0aGVyIGdjLiBJIGFtIG5vdCBzdXJlIHdoZXRoZXIgaXQgaXMg
ZXhwZWN0ZWQKPiA+IHRoYXQgdGhlIGYyZnNfc3VtbWFyeV9ibG9jayBhZGRyZXNzIGluIGdjIHRo
cmVhZCBpcyBub3QgZnJvbQo+ID4gYWxsb2NhdGlvbiBpbiBidWlsZF9jdXJzZWcoKS4gQmVjYXVz
ZSBJIGFtIG5vdCBmYW1pbGlhciB3aXRoIGYyZnMuCj4gPgo+ID4gQ291bGQgeW91IGhlbHAgY29t
bWVudCBvbiBteSBxdWVzdGlvbiBhbmQgbmV3IGlzc3VlPyBJcyB0aGVyZSBhbnkgd29yawo+ID4g
aW4gcHJvZ3Jlc3MgdG8gZml4IHRoZSBuZXcgYmxvY2tlZCBpc3N1ZT8gVGhhbmtzIQo+Cj4gUGxl
YXNlIGNoZWNrIGJlbG93IHBhdGNoOgo+Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvY2hhby9saW51eC5naXQvY29tbWl0Lz9oPWRldi10ZXN0JmlkPTIy
NzJkMDg3ODFhNzNiNmQ3MDM5ZWQ3MGY2ZDY4ZDg3YWM4MmYyNTYKPgpUaGFua3MgZm9yIHRoZSBw
YXRjaCEgSSBjaGVycnkgcGljayBiZWxvdyAzIHBhdGNoZXMgZnJvbSB5b3VyIGJyYW5jaCB0byBt
YWlubGluZQp0byB0ZXN0IHRoZSBidWcuIEl0IGlzIG5vdCByZXByb2R1Y2VkIGFueSBtb3JlLgoK
YjM4MGNlZGRhN2MzIGYyZnM6IGZpeCB0byBkbyBzYW5pdHkgY2hlY2sgb24gaV9leHRyYV9pc2l6
ZSBpbiBpc19hbGl2ZSgpCmNkY2IxNzNjMTU4ZSBmMmZzOiBGaXggdGhlIHJhY2UgY29uZGl0aW9u
IG9mIHJlc2l6ZSBmbGFnIGJldHdlZW4gcmVzaXplZnMKYzMxNmZiNjBmNWZiIGYyZnM6IHNob3Vs
ZCBwdXQgYSBwYWdlIHdoZW4gY2hlY2tpbmcgdGhlIHN1bW1hcnkgaW5mbwoKQlRXOiAgYmVsb3cg
bG9nIGxpbmUgaXMgcmVwZWF0ZWQgZW5kbGVzcyBpZiBjZGNiMTczYzE1OGUgaXMgbWlzc2luZy4K
WyAgMTQyLjc2NjIzN11bICAgIFQ5XSBGMkZTLWZzIChsb29wMCk6IEluY29uc2lzdGVudCBibGth
ZGRyIG9mZnNldDoKYmFzZTo5LCBvZnNfaW5fbm9kZTo1MDE2MSwgbWF4OjkyMywgaW5vOjgsIG5p
ZDo4CgpSZWdhcmRzLApKdW4KCgo+IFRoYW5rcywKPgo+ID4KPiA+IFswXSBodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS9idWc/aWQ9NGNiY2ZmMDA0MjJlYTQwMmMyZTViZTJiYzA0MWE4ZjQx
OTZkNjA4Ywo+ID4gWzFdIGM2YWQ3ZmQxNjY1NyBmMmZzOiBmaXggdG8gZG8gc2FuaXR5IGNoZWNr
IG9uIHN1bW1hcnkgaW5mbwo+ID4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
