Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D8F2FE830
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Jan 2021 11:58:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2XfE-0000D4-C7; Thu, 21 Jan 2021 10:58:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1l2XfD-0000Cy-TP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 10:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TOcc6smGKrQ7ZrXNRSinoNICfIztx//2OX5jd0yU1no=; b=e5yp7YuMRoCsuTpkZ3T4yq8lRF
 Wd98sbij5Drxhg8AZEn63qpGLNVt8koAuwPHW8g0y88IJbFmHnv8VHMAuEjHHc1joTiq8bvMQCFY4
 5+b+QghpGSex+Oa574QoIuXde/kxtXciRSgIsUi49PinkaCm9CNSxXNiv2e3Y4X9//6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TOcc6smGKrQ7ZrXNRSinoNICfIztx//2OX5jd0yU1no=; b=e92qZORyqPH+LK9ggnbXhPs9gf
 hQtw78lGd/3A1GVKKCjavtYmHrUfBYtWP9xP068PNnaIyDrG14OAEL4ORVD+tqTrHEKR/kQjmroZB
 coK9eLvZBDF8v86aljm4MZM9duW5Lib9gtl0UqSlqwuR17HH9UzfmekshXI5U6eSDLnU=;
Received: from mail-lf1-f48.google.com ([209.85.167.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2Xf3-002TSm-O5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 10:58:07 +0000
Received: by mail-lf1-f48.google.com with SMTP id u25so1925006lfc.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Jan 2021 02:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TOcc6smGKrQ7ZrXNRSinoNICfIztx//2OX5jd0yU1no=;
 b=mss4EFQeqFKkwsXwSPbwNZwUgDfQKoZdj/HMsTafLIT7fJ75dCqGWBbB4sS58gRW9W
 h7Nfm29U1IGmAO4Gk1zmjxdwatxIsRd30acNBXKCeDeRq0zo2YfKm9lyRUxtWII8Utyb
 zmap8u8qqHEFBFjtQtte9p6F4U/VMYz+SyEb9xtkfjWJKmyRvpsJlE8jrQa14IGeSTAm
 0OnUAw8eEVchIhCwHoB2ggsoJvOw4j7ZV/qG5/irj6V/HG2nR2qI0OF3HpCgGWTP3Fem
 BPlTJ01vPZ6aICOvFH4oP1tYPQEQ76+y2/cI+hqGJZRMQ2st5mHfxXP9205g53AvIzRP
 XyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TOcc6smGKrQ7ZrXNRSinoNICfIztx//2OX5jd0yU1no=;
 b=S8ngzSsa3nRS4OrDwiETTBbkELFtS0iae9NUoUoqV1vAxus6KPDFVtt9m10Iqigrmk
 pDLbJRGuYTjtTjRZlN/PamWh1LiQna+oHz0rzIH//FmTkseBMq1SnmORjX8nmZnRzbO0
 nzk/VdU5xY3ivIxeD/4oKnNmiM2zyLrJ5gA66Da8JirhUaFfPeZK1n4sG/QfXMs8Vabh
 45i35ydKWvjSRNqX1UJy9Uaygc0hDzNT7wJ0mOQW1VtfirPWd8u1IWDySCpufIpzLsaY
 mqYUDSfoF0/MnKjVFXl2E4T+t1On16yDjbK3alttDEqizKfY1ijHxNRGDb09yA8gcAYJ
 hnHg==
X-Gm-Message-State: AOAM5325YEp7Nb4OzWKm+wmaW8A0QiHFacg0aux1xXietVrprqqQ1w95
 ISe3iKOqxC4cGCVl/pFjZ7TqoOhgxzmAYbTcrig=
X-Google-Smtp-Source: ABdhPJy3wP8/k/AMEGsTc1qC6WhdFhqHnDhEZrBjupyYszXa/tZjzOqXIt9m8rUHQs3qwe3RQAvfy8lc0ejAB+prclU=
X-Received: by 2002:a19:5052:: with SMTP id z18mr4672874lfj.554.1611226671040; 
 Thu, 21 Jan 2021 02:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20210114062302.3809664-1-daeho43@gmail.com>
 <20210114062302.3809664-2-daeho43@gmail.com>
 <d4c12d47-db33-7e76-b7ad-4d80ced1aba9@huawei.com>
In-Reply-To: <d4c12d47-db33-7e76-b7ad-4d80ced1aba9@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 21 Jan 2021 19:57:40 +0900
Message-ID: <CACOAw_xj-=scjMAF5Gzwe82p-roT0eTWhTuaFJFCHfrazpOA9A@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.48 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.48 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l2Xf3-002TSm-O5
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: add ckpt_thread_ioprio sysfs
 node
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T29wcywgaXQgZGlzYXBwZWFyZWQgd2hpbGUgdmVyc2lvbmluZyB1cC4uLgoKMjAyMeuFhCAx7JuU
IDIx7J28ICjrqqkpIOyYpO2bhCA3OjMwLCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+64uY
7J20IOyekeyEsToKPgo+IE9uIDIwMjEvMS8xNCAxNDoyMywgRGFlaG8gSmVvbmcgd3JvdGU6Cj4g
PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4KPiA+IEFkZGVk
ICJja3B0X3RocmVhZF9pb3ByaW8iIHN5c2ZzIG5vZGUgdG8gZ2l2ZSBhIHdheSB0byBjaGFuZ2Ug
Y2hlY2twb2ludAo+ID4gbWVyZ2UgZGFlbW9uJ3MgaW8gcHJpb3JpdHkuIEl0cyBkZWZhdWx0IHZh
bHVlIGlzICJiZSwzIiwgd2hpY2ggbWVhbnMKPiA+ICJCRSIgSS9PIGNsYXNzIGFuZCBJL08gcHJp
b3JpdHkgIjMiLiBXZSBjYW4gc2VsZWN0IHRoZSBjbGFzcyBiZXR3ZWVuICJydCIKPiA+IGFuZCAi
YmUiLCBhbmQgc2V0IHRoZSBJL08gcHJpb3JpdHkgd2l0aGluIHZhbGlkIHJhbmdlIG9mIGl0Lgo+
ID4gIiwiIGRlbGltaXRlciBpcyBuZWNlc3NhcnkgaW4gYmV0d2VlbiBJL08gY2xhc3MgYW5kIHBy
aW9yaXR5IG51bWJlci4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9q
ZW9uZ0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiB2MjoKPiA+IC0gYWRhcHQgdG8gaW5saW5pbmcg
Y2twdF9yZXFfY29udHJvbCBvZiBmMmZzX3NiX2luZm8KPiA+IC0tLQo+ID4gICBEb2N1bWVudGF0
aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMgfCAgOCArKysrCj4gPiAgIGZzL2YyZnMvY2hl
Y2twb2ludC5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgIGZzL2YyZnMvZjJmcy5o
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICAgZnMvZjJmcy9zeXNmcy5jICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4g
ICA0IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzIGIv
RG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4gPiBpbmRleCAzZGZlZTk0
ZTA2MTguLjBjNDhiMmU3ZGZkNCAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3Rl
c3Rpbmcvc3lzZnMtZnMtZjJmcwo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9z
eXNmcy1mcy1mMmZzCj4gPiBAQCAtMzc3LDMgKzM3NywxMSBAQCBEZXNjcmlwdGlvbjogICAgIFRo
aXMgZ2l2ZXMgYSBjb250cm9sIHRvIGxpbWl0IHRoZSBiaW8gc2l6ZSBpbiBmMmZzLgo+ID4gICAg
ICAgICAgICAgICBEZWZhdWx0IGlzIHplcm8sIHdoaWNoIHdpbGwgZm9sbG93IHVuZGVybHlpbmcg
YmxvY2sgbGF5ZXIgbGltaXQsCj4gPiAgICAgICAgICAgICAgIHdoZXJlYXMsIGlmIGl0IGhhcyBh
IGNlcnRhaW4gYnl0ZXMgdmFsdWUsIGYyZnMgd29uJ3Qgc3VibWl0IGEKPiA+ICAgICAgICAgICAg
ICAgYmlvIGxhcmdlciB0aGFuIHRoYXQgc2l6ZS4KPiA+ICtXaGF0OiAgICAgICAgICAgICAgICAv
c3lzL2ZzL2YyZnMvPGRpc2s+L2NrcHRfdGhyZWFkX2lvcHJpbwo+ID4gK0RhdGU6ICAgICAgICAg
ICAgICAgIEphbnVhcnkgMjAyMQo+ID4gK0NvbnRhY3Q6ICAgICAiRGFlaG8gSmVvbmciIDxkYWVo
b2plb25nQGdvb2dsZS5jb20+Cj4gPiArRGVzY3JpcHRpb246IEdpdmUgYSB3YXkgdG8gY2hhbmdl
IGNoZWNrcG9pbnQgbWVyZ2UgZGFlbW9uJ3MgaW8gcHJpb3JpdHkuCj4gPiArICAgICAgICAgICAg
IEl0cyBkZWZhdWx0IHZhbHVlIGlzICJiZSwzIiwgd2hpY2ggbWVhbnMgIkJFIiBJL08gY2xhc3Mg
YW5kCj4gPiArICAgICAgICAgICAgIEkvTyBwcmlvcml0eSAiMyIuIFdlIGNhbiBzZWxlY3QgdGhl
IGNsYXNzIGJldHdlZW4gInJ0IiBhbmQgImJlIiwKPiA+ICsgICAgICAgICAgICAgYW5kIHNldCB0
aGUgSS9PIHByaW9yaXR5IHdpdGhpbiB2YWxpZCByYW5nZSBvZiBpdC4gIiwiIGRlbGltaXRlcgo+
ID4gKyAgICAgICAgICAgICBpcyBuZWNlc3NhcnkgaW4gYmV0d2VlbiBJL08gY2xhc3MgYW5kIHBy
aW9yaXR5IG51bWJlci4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NoZWNrcG9pbnQuYyBiL2Zz
L2YyZnMvY2hlY2twb2ludC5jCj4gPiBpbmRleCBlMDY2OGNlYzNiODAuLjYyYmQ2ZjQ0OWJiNyAx
MDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4gPiArKysgYi9mcy9mMmZzL2No
ZWNrcG9pbnQuYwo+ID4gQEAgLTE4NDAsNyArMTg0MCw3IEBAIGludCBmMmZzX3N0YXJ0X2NrcHRf
dGhyZWFkKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+ICAgICAgIGlmIChJU19FUlIoY3By
Yy0+ZjJmc19pc3N1ZV9ja3B0KSkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoY3By
Yy0+ZjJmc19pc3N1ZV9ja3B0KTsKPiA+Cj4gPiAtICAgICBzZXRfdGFza19pb3ByaW8oY3ByYy0+
ZjJmc19pc3N1ZV9ja3B0LCBERUZBVUxUX0NIRUNLUE9JTlRfSU9QUklPKTsKPiA+ICsgICAgIHNl
dF90YXNrX2lvcHJpbyhjcHJjLT5mMmZzX2lzc3VlX2NrcHQsIGNwcmMtPmNrcHRfdGhyZWFkX2lv
cHJpbyk7Cj4KPiBXaGVyZSBkbyB3ZSBzZXQgZGVmYXVsdCB2YWx1ZSBvZiBjcHJjLT5ja3B0X3Ro
cmVhZF9pb3ByaW8/IEkgZ3Vlc3MgaXQgc2hvdWxkCj4gYmUgZjJmc19pbml0X2NrcHRfcmVxX2Nv
bnRyb2woKT8KPgo+IFRoYW5rcywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
