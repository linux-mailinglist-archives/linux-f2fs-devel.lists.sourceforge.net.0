Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EC61161BB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Dec 2019 14:51:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RzEv97ZBG02vfCjBgjvEkEQsH8+pRwX7ka063WwnCWk=; b=PW0MyWOXax/DQRHJcmBpV1UX3
	0jOY52XiewT3lRaOQCEmvwsW89cHMT+xLYOttyLBH12Dd7tV6dGABNVdDxRItqziQf4Xq2eJ+saoo
	Uq0LNmaW8m8AG618LO8uCFJNoZXPnCgW2lcDr1wvMQWXp1Xqd9yKSDUsKjfhwVnfcjfNs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1idwyP-0007KY-78; Sun, 08 Dec 2019 13:51:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@aol.com>) id 1idwyN-0007K9-Qe
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Dec 2019 13:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q/YPQxEAxJ5aBYx16SVmb/CPN8OO7gV3jCs34jLQ6GI=; b=REmwq08VwWM7SCAfgoMecFA3eA
 l1F2nvSBOVkV4dUtDKVjrzerKyLYTb21ny7nSMsylANdL4kOO56R7G/vFbQecIRnfuBwWkZEee8gs
 slxfrT5XwqjYFYOl5VHoUm7fL9+QPuhlf+jnHkWhq/Wp7r6jSW1E5/x2NIOFim0Le0SY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q/YPQxEAxJ5aBYx16SVmb/CPN8OO7gV3jCs34jLQ6GI=; b=j6pnll/jHgRtqcr+Qy/8ZYX4Hr
 OETPFGF+oY+YieHKWqCyTJHXeJw0JbZh0IqC3fgkcTnZ38AY2UEcWOxFn44LuKQYNBasNP9qGtJZz
 O6pqCThsjjkbjtMwxkL+G3V1fjP5Wzs3jM4wVvTS0ozGgXDCNoJ2PM65Lbu5zm6tnrSs=;
Received: from sonic304-24.consmr.mail.gq1.yahoo.com ([98.137.68.205])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1idwyM-00E4hi-4Y
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Dec 2019 13:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1575813096; bh=Q/YPQxEAxJ5aBYx16SVmb/CPN8OO7gV3jCs34jLQ6GI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
 b=kMBa+NLR5CdzlHaboS7bFZn7N8ozmyZk3ID7EmQuGOdQ/40V5uRwT8Dpu5Qt6Zv5IK5SI3Dm04cLhKSlYo8QpLMeok37eMRILkxbvT3iPWRhYiDF20uqNswwMvVjFK51VCX0m3JQ2gKVYU8pSvvb9USh+eEeFgOErCvBfN+jB4SFvlT/F27PA0y/+utc0AZrRHAVpPYOOcYWL32/+UKhbVQP7Ppc1Csy6rDfJ4e6q+1gKYXAn0Yq3V4+JC4PcjxuSpPW9IkwAPTF7+8rGZ0oqPUX5frZdJZ3Y4QLHqD8VUw2zD7++6/C5JJ2YtTZJJiV1MJNSpu4XHyy/4LNjphftA==
X-YMail-OSG: WiaK0ooVM1niIJvwnABnYccZwxdXwCUxFH5AC1KkMaSRxtJSXgy5jwF6wpRUAyA
 uerngTiS0pVzee5Bpq07dXoak3gWspCXB9Kz_GWgvTBcc3wrG4xco42hNTvSbaJjYK9a5qqZdEpE
 Wt4zuc.YAx3h2nbnJvAgE0XtBJT1MpAsvYJcT5NzExa7exkz7MUMRketOlrrWF.2pBerLo_D4Mzl
 3glKg9Q9CVQo2WUUI3FYnZfb7t4Sl1hrhMF_9qCfc9F36LeDDH.NmF5MxBgwcu1oylzy31NviCk5
 HcqibzpL9iuJwPfVxCYRf3Pytb4tF3YE3thiczOw2Pgz.2qms62EwHI1uxcBTayhGj.qpFHQ.Kiy
 Ov_g21ARRStIYYm4U2CdjZT1BRfscPctUi9yXpNQxOHQAOh27x901xrJQIw2QlHIcWt0ujC.VZ7A
 qeHTX3yb9UJsC_t1NdkeUO5pKtvyXJWoh4GYOc1kfs0LlAHrT8O2KpfX79e5i3691aWCaLTx9EXi
 9DvLZQ3A_INSLJU4v0tvqszXP2_M7HzxGQGPvzalVNd8A6_ZGufB_YOvjrvfuSFIY6PjuKIGGAUy
 tP9sEOGhyK5qEdKKxmIIM2yy8dP_3hcOSuNor8kv8rA6VaFGimHpvLpzyVwM8X6axwG9PQKjZJSA
 F_8xRYte4m8CWB6dtsnmN6e1uOGALuUwDRdiGq18_fUHxoW4VlK_MSU6X1xf3PEoHBXFsCrts6RW
 OHCCzp272T.senJSDfXV.0VBGHWFFGLFJf0kbcWy_q3YqBqqTYJS.o5QxzprcL7ODXv7A29kygks
 WGvNwSa6_l4IlNJQbVwvnQxzzhAgEHP.1euH.BOKYw1bMBRC.Xx8ER5_NUYDh19kcOcJDM77xrTN
 _ZaLx_isUgbxroyCUscMjZ9w9QTcQQLpXZmo5jNI_8CrVROCR0byaVzpG2mJBUZI6yYbzX9fNhHX
 aXiIaZBeu4YIpHp8ujpkxGP9DckJ4Az5vK2M6u6OY8xWPsZkcmDzK.OBTVWWZVoKrsiWxSPPR_YE
 SReRuQtqausweNNc5INwMz.YCFYb9_mq0Z5kvbJJ3gebuE17XvtnG2kjz7cUMryWoc5vh5YoTwhG
 pXcuX8VwCHPDCsQAKNREk2Av8hz0ybR6rlHYct09fT_wGMQ3706lL.ymvSn9jFugfVoHtXXrgPCg
 SCxC5lXW4deeALvYieqtr4BIvXnewFuGGoWEk1iu61FpVBd1dQxPHkB8q_b10YoqV.zwJLiy.XYa
 Yjwiuxctnly7oQm3mqnjAWWF5DZPk3wzSKNs7vzjlqGSpOZGYNixhPXWWR0qSvRuafpQNR3Yqow.
 9uL.8eh8hthUqe8FYdjSM7u9ty8Xed1yMVgaV_Tljje2l2TiN7w1Sr7fRbpVOy0LP9Ba6bRwHLQy
 0Lsos
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Sun, 8 Dec 2019 13:51:36 +0000
Received: by smtp426.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 2702a2e0ca5f3ca7491b54209e2e55dc; 
 Sun, 08 Dec 2019 13:51:35 +0000 (UTC)
Date: Sun, 8 Dec 2019 21:51:21 +0800
To: Hongwei Qin <glqinhongwei@gmail.com>
Message-ID: <20191208135117.GA12771@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <tencent_0B38BD6C2739091DE8A052D6D772D1DEAA06@qq.com>
 <4ef45a4b-47fa-4d7e-a060-4cad56ca372a@kernel.org>
 <CAKvRR0QoH2RAEzb9ki8GVUX22omST-Z2kq287i0fXmYXC7XCLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKvRR0QoH2RAEzb9ki8GVUX22omST-Z2kq287i0fXmYXC7XCLw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailer: WebService/1.1.14728 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [98.137.68.205 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1idwyM-00E4hi-4Y
Subject: Re: [f2fs-dev] Potential data corruption?
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
From: Gao Xiang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Gao Xiang <hsiangkao@aol.com>
Cc: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgpPbiBTdW4sIERlYyAwOCwgMjAxOSBhdCAwOToxNTo1NVBNICswODAwLCBIb25nd2VpIFFp
biB3cm90ZToKPiBIaSwKPiAKPiBPbiBTdW4sIERlYyA4LCAyMDE5IGF0IDEyOjAxIFBNIENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGVsbG8sCj4gPgo+ID4gT24gMjAx
OS0xMi03IDE4OjEwLCDvv73vv73vv73Vte+/ve+/ve+/ve+/ve+/ve+/ve+/vSB3cm90ZToKPiA+
ID4gSGkgRjJGUyBleHBlcnRzLAo+ID4gPiBUaGUgZm9sbG93aW5nIGNvbmZ1c2VzIG1lOgo+ID4g
Pgo+ID4gPiBBIHR5cGljYWwgZnN5bmMoKSBnb2VzIGxpa2UgdGhpczoKPiA+ID4gMSkgSXNzdWUg
ZGF0YSBibG9jayBJT3MKPiA+ID4gMikgV2FpdCBmb3IgY29tcGxldGlvbgo+ID4gPiAzKSBJc3N1
ZSBjaGFpbmVkIG5vZGUgYmxvY2sgSU9zCj4gPiA+IDQpIFdhaXQgZm9yIGNvbXBsZXRpb24KPiA+
ID4gNSkgSXNzdWUgZmx1c2ggY29tbWFuZAo+ID4gPgo+ID4gPiBJbiBvcmRlciB0byBwcmVzZXJ2
ZSBkYXRhIGNvbnNpc3RlbmN5IHVuZGVyIHN1ZGRlbiBwb3dlciBmYWlsdXJlLCBpdCByZXF1aXJl
cyB0aGF0IHRoZSBzdG9yYWdlIGRldmljZSBwZXJzaXN0cyBkYXRhIGJsb2NrcyBwcmlvciB0byBu
b2RlIGJsb2Nrcy4KPiA+ID4gT3RoZXJ3aXNlLCB1bmRlciBzdWRkZW4gcG93ZXIgZmFpbHVyZSwg
aXQncyBwb3NzaWJsZSB0aGF0IHRoZSBwZXJzaXN0ZWQgbm9kZSBibG9jayBwb2ludHMgdG8gTlVM
TCBkYXRhIGJsb2Nrcy4KPiA+Cj4gPiBGaXJzdGx5IGl0IGRvZXNuJ3QgYnJlYWsgUE9TSVggc2Vt
YW50aWNzLCByaWdodD8gc2luY2UgZnN5bmMoKSBkaWRuJ3QgcmV0dXJuCj4gPiBzdWNjZXNzZnVs
bHkgYmVmb3JlIHN1ZGRlbiBwb3dlci1jdXQsIHNvIHdlIGNhbiBub3QgZ3VhcmFudGVlIHRoYXQg
ZGF0YSBpcyBmdWxseQo+ID4gcGVyc2lzdGVkIGluIHN1Y2ggY29uZGl0aW9uLgo+ID4KPiA+IEhv
d2V2ZXIsIHdoYXQgeW91IHdhbnQgbG9va3MgbGlrZSBhdG9taWMgd3JpdGUgc2VtYW50aWNzLCB3
aGljaCBtb3N0bHkgZGF0YWJhc2UKPiA+IHdhbnQgdG8gZ3VhcmFudGVlIGR1cmluZyBkYiBmaWxl
IHVwZGF0ZS4KPiA+Cj4gPiBGMkZTIGhhcyBzdXBwb3J0IGF0b21pY193cml0ZSB2aWEgaW9jdGws
IHdoaWNoIGlzIHVzZWQgYnkgU1FMaXRlIG9mZmljaWFsbHksIEkKPiA+IGd1ZXNzIHlvdSBjYW4g
Y2hlY2sgaXRzIGltcGxlbWVudGF0aW9uIGRldGFpbC4KPiA+Cj4gPiBUaGFua3MsCj4gPgo+IAo+
IFRoYW5rcyBmb3IgeW91ciBraW5kIHJlcGx5Lgo+IEl0J3MgdHJ1ZSB0aGF0IGlmIHdlIG1lZXQg
cG93ZXIgZmFpbHVyZSBiZWZvcmUgZnN5bmMoKSBjb21wbGV0ZXMsCj4gUE9TSVggZG9lbid0IHJl
cXVpcmUgRlMgdG8gcmVjb3ZlciB0aGUgZmlsZS4gSG93ZXZlciwgY29uc2lkZXIgdGhlCj4gZm9s
bG93aW5nIHNpdHVhdGlvbjoKPiAKPiAxKSBEYXRhIGJsb2NrIElPcyAoTm90IHBlcnNpc3RlZCkK
PiAyKSBOb2RlIGJsb2NrIElPcyAoQWxsIFBlcnNpc3RlZCkKPiAzKSBQb3dlciBmYWlsdXJlCj4g
Cj4gU2luY2UgdGhlIG5vZGUgYmxvY2tzIGFyZSBhbGwgcGVyc2lzdGVkIGJlZm9yZSBwb3dlciBm
YWlsdXJlLCB0aGUgbm9kZQo+IGNoYWluIGlzbid0IGJyb2tlbi4gTm90ZSB0aGF0IHRoaXMgZmls
ZSdzIG5ldyBkYXRhIGlzIG5vdCBwcm9wZXJseQo+IHBlcnNpc3RlZCBiZWZvcmUgY3Jhc2guIFNv
IHRoZSByZWNvdmVyeSBwcm9jZXNzIHNob3VsZCBiZSBhYmxlIHRvCj4gcmVjb2duaXplIHRoaXMg
c2l0dWF0aW9uIGFuZCBhdm9pZCByZWNvdmVyIHRoaXMgZmlsZS4gSG93ZXZlciwgc2luY2UKPiB0
aGUgbm9kZSBjaGFpbiBpcyBub3QgYnJva2VuLCBwZXJoYXBzIHRoZSByZWNvdmVyeSBwcm9jZXNz
IHdpbGwgcmVnYXJkCj4gdGhpcyBmaWxlIGFzIHJlY292ZXJhYmxlPwoKQXMgbXkgb3duIGxpbWl0
ZWQgdW5kZXJzdGFuZGluZywgSSdtIGFmcmFpZCBpdCBzZWVtcyB0cnVlIGZvciBleHRyZW1lIGNh
c2UuCldpdGhvdXQgcHJvcGVyIEZMVVNIIGNvbW1hbmQsIG5ld2VyIG5vZGVzIGNvdWxkIGJlIHJl
Y292ZXJlZCBidXQgbm8gbmV3ZXIKZGF0YSBwZXJzaXN0ZWQuCgpTbyBpZiBmc3luYygpIGlzIG5v
dCBzdWNjZXNzZnVsLCB0aGUgb2xkIGRhdGEgc2hvdWxkIGJlIHJlYWRlZApidXQgZm9yIHRoaXMg
Y2FzZSwgdW5leHBlY3RlZCBkYXRhIChub3QgQSBvciBBJywgY291bGQgYmUgcmFuZG9tIGRhdGEK
Qykgd2lsbCBiZSBjb25zaWRlcmVkIHZhbGlkbHkgc2luY2UgaXRzIG5vZGUgaXMgb2suCgpJdCBz
ZWVtcyBpdCBzaG91bGQgRkxVU0ggZGF0YSBiZWZvcmUgdGhlIHJlbGF0ZWQgbm9kZSBjaGFpbiB3
cml0dGVuIG9yCmludHJvZHVjZSBzb21lIGRhdGEgY2hlY2tzdW0gdGhvdWdoLgoKSWYgSSBhbSB3
cm9uZywga2luZGx5IGNvcnJlY3QgbWUuLi4KClRoYW5rcywKR2FvIFhpYW5nCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
