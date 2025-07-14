Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0017B03BB6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Jul 2025 12:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OejtI1ZCko6zqoaMd2TIqcRzrMXCD0Hwdly+d3ajljk=; b=gHcWmvlI4347rYk4mfsZ2S+8me
	QNutwt+bI76/6d/unQc8BYUpzestcyUFe95dWFvC0dHVMzUnZdX6zGxKGx4wgjuupYqcgz2ySc8/u
	INc7NBKatI93ih8kNZWBm55k/7x4yTqva3VQs7dylJLuf7nYHMsuDs/gjjtn/LB8oSko=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubGDX-0007iR-QD;
	Mon, 14 Jul 2025 10:15:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao.sigma@gmail.com>) id 1ubGDV-0007iK-T8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Jul 2025 10:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cDb5lQps4pqch8OzRG9JScmmuiHc/7OtB6DGSuBO7fc=; b=lHJcd3EUT9vM/T9UoGGxqGJy9n
 tKIsw5ZDjJ7oVyOWNmWdpmWK6SuEp0BIJfqSg32KK8OoC7yP37ZpIiqmhlcOQGtrxmm0ZJKZHToKe
 1Z0aQpP3RKLBwuJzuAH/5CoALKHKII8s6axtRlIimeC7rdXM5wtkbYx+Jh2a2pO3nw28=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cDb5lQps4pqch8OzRG9JScmmuiHc/7OtB6DGSuBO7fc=; b=jPXUlVwTdyLrV45W1E1QSbWLwf
 bNRTbD/lPq2CmwJBCwy6EWN1x43AHjTVuO32KXzCYyGPXAPEniYsbXdqN4+DkSeBqzdRU7HjwmIsS
 KJ18Ik9NXuSrMoUXj+r0eUu9DsAAdfwHzQZVRvbGUJwKQkn3OS7HAO5aIUQtP1PF+2HY=;
Received: from mail-oo1-f68.google.com ([209.85.161.68])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ubGDV-0003I9-B6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Jul 2025 10:15:25 +0000
Received: by mail-oo1-f68.google.com with SMTP id
 006d021491bc7-613c7b65039so552055eaf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Jul 2025 03:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752488119; x=1753092919; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cDb5lQps4pqch8OzRG9JScmmuiHc/7OtB6DGSuBO7fc=;
 b=hZUtJ8531IVZlHR9iwQuKqLML55RgFs8Z6/lQtzhnQqAzpavYegqI+UL92UqpkYJ4v
 RaolTGMFzJOcKm/i5D/DKASLCRRc/lZOKBxE7eO447FoEGaV+d8yjo8rV4+t5jxAh5xX
 cYiZyOgIb/a2UigXYaYiAKdVQheeHpxRYBL8fHeCuqu1Op5kUqiDwbvy55Jol6BIGl5J
 HtHWSLz+fzeAYBFWAwMIpDKNmYeaQbdg2mS9tbqRB0g1dXT5Z8ewmCsG/NoO1gCIclJF
 Zo0onK4ZQQmH8rGtRnUlnW8siV/a4J0CSayyBsoiOcvLY4m5xvMTXyDj8KWNBtHg4fKR
 n+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752488119; x=1753092919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cDb5lQps4pqch8OzRG9JScmmuiHc/7OtB6DGSuBO7fc=;
 b=UoLZy4z/7Nwans21x8wmlnH/LNMMYkH5wq9E5EQ7EOpgJ5KKShFNSZRYZSi72Wz4OO
 K1NtY31bpTOrqV+4LQqoCBTAw4wD7Sogf2LDCNiViApqoC4+JPFKJD1gif1+UzwuqKUs
 u5V1odC8/ZMY/uY7dFTUDmBGKlcFctAHi4rg7lEA9mmB/HXhnodze4TKTUCmyjM5cZzS
 Pb/xr4FJfMwsgkjDZMyje5Acocg+tLUr4plBVKDttEPYL6NBe0mdiYmPai4Hn49ht+Rz
 vGUZ7xz2/a8EHL9VWhW7EyNyfycbbElby8ma1Dja/ZeTnHugYtGnXk3ZoKflgo518NpX
 tEow==
X-Gm-Message-State: AOJu0YwwYJfa6LuNKxy+5XDisryL2V//cqfowdu8NwFwO5Q/+6O1XZxW
 XCnKix1BSY0u798wEhGZ6koPcyxe5haNc+TvN6kHiTL6nJEsPTB0xMoCdeUXwpRix1eNt+ZqpZr
 knNNxuOma6bMf6ytbCoER7CLizxyo9/BGZLjT1Tk=
X-Gm-Gg: ASbGncsyKNI5GqtvOmGqLVlq/a7zdowPMqx0QtNfLKq8D8uayVQHZbuaN9XbzbIzRdD
 MUThD8+lLhWvUAZeLcpjbU+/7mEbPPkuL/D7Rm5yqS+fYmpSJu6MmkbGwaiGvvr1xVf6cAGqTzh
 aJX8j3+OqzrAlCSBIj5D9jcAAABZFKq0Kc9SKeDkzjLMJI89T/QHTIRbpdBWn3GFCnTBQIhLZjg
 vf69Q==
X-Google-Smtp-Source: AGHT+IFHnCeSNbuxL4NvvibJbdsNDFb3RpsGW3yS1sNP1cD/rrwT/ZPRfbcQptgWsVRk/1D/TpHMe/QiLkIhyE+JH3c=
X-Received: by 2002:a05:6808:228a:b0:409:f8e:727f with SMTP id
 5614622812f47-4150d6482b9mr9013881b6e.3.1752488119499; Mon, 14 Jul 2025
 03:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAMLCH1GjsjgLDZdqFnRRxycoGoHH1Ayu0rUBHeusyQVhZfBopg@mail.gmail.com>
 <CAMLCH1FtQa48ryOeE3Nzeo-kiOcaB1W4Sic9CjCsQsLVL28ciA@mail.gmail.com>
In-Reply-To: <CAMLCH1FtQa48ryOeE3Nzeo-kiOcaB1W4Sic9CjCsQsLVL28ciA@mail.gmail.com>
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Date: Mon, 14 Jul 2025 18:15:07 +0800
X-Gm-Features: Ac12FXy0_nZg1VQwipKvmqGYcFgIIyBeUrHzUuQ6q8i4zePqikUymaoSzyIuK0M
Message-ID: <CAMLCH1EwN==C2nPKjYj2Bi4SnWr-yXR37piv5P8qu5KMxgDUtw@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Besides,
 I noticed now your convert fio->page to folio.I personally
 thought it's a bold (maybe too bold) decision. fio structure has a strong
 hypothesis that it performs write I/O in single page unit. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao.sigma(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.68 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ubGDV-0003I9-B6
Subject: Re: [f2fs-dev] [WIP] f2fs: Sharing progress and questions on large
 folios support
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "v-songbaohua@oppo.com" <v-songbaohua@oppo.com>,
 Zhang Yi <yi.zhang@huaweicloud.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

IEJlc2lkZXMsSSBub3RpY2VkIG5vdyB5b3VyIGNvbnZlcnQgZmlvLT5wYWdlIHRvIGZvbGlvLkkg
cGVyc29uYWxseQp0aG91Z2h0IGl0J3MgYSBib2xkIChtYXliZSB0b28gYm9sZCkgZGVjaXNpb24u
CmZpbyBzdHJ1Y3R1cmUgaGFzIGEgc3Ryb25nIGh5cG90aGVzaXMgdGhhdCBpdCBwZXJmb3JtcyB3
cml0ZSBJL08gaW4Kc2luZ2xlIHBhZ2UgdW5pdC5JdCBvbmx5IHN0b3JlcyBvbmUgb2xkX2Jsa2Fk
ZHIgYW5kCm9uZSBuZXdfYmxrYWRkciBhc3NvY2lhdGVkIHdpdGggdGhlIGZpby0+cGFnZSB3aXRo
b3V0IGF3YXJlbmVzcyBvZiB0aGUKcGFnZSdzIGluZGV4IG9yIGZpbGUgcG9zaXRpb24uQW5kIGFs
bCB0aGUgZjJmcydzCnN1Ym1pdCB3cml0ZSBsb2dpYyBkaXJlY3RseSB1c2UgYmlvX2FkZF9wYWdl
IHRvIGFkZCBmaW8tPnBhZ2UgdG8KYmlvLklmIHdlIGNvbnZlcnQgZmlvLT5wYWdlIHRvIGZpby0+
Zm9saW8sdGhlbiBob3cgZG8gd2Uga25vdyB0aGUKZXhhY3QgcGFydCBvZiB0aGUgZm9saW8gd2Ug
YXJlIHBlcmZvcm1pbmcgd3JpdGUgYW5kIGFkZCB0byBiaW8/IE1heWJlCndlIHNob3VsZCBhbHNw
IHN0b3JlIHRoZSBjb3JyZXNwb25kaW5nIGZvbGlvJ3Mgc3VicGFnZSdzIGluZGV4IGluCmZpbz9P
ciBkaWQgSSBtaXNzIHNvbWV0aGluZyBpbiB5b3VyIG5ld2VzdCBwYXRjaD8KCgpOYW56aGUgWmhh
byA8bnp6aGFvLnNpZ21hQGdtYWlsLmNvbT4g5LqOMjAyNeW5tDfmnIgxMuaXpeWRqOWFrSAyMTow
MuWGmemBk++8mgo+Cj4gT2gsSSdtIHNvcnJ5LEkgZm9yZ290IHRvIHB1dCBteSBnaXRodWIgbGlu
ayBpbiBsYXN0IGVtYWlsLkJ1dCBJIGhhdmVuJ3QgcHJlcGFyZWQgYW4gRW5nbGlzaCBkb2N1bWVu
dCBmb3IgZGVzY3JpYmluZyBteSBjb2RlIGRlc2lnbi5Bbnl3YXksYXJlIHlvdSBpbnRlcmVzdGVk
IGluIG15IHdvcms/Cj4KPgo+IE5hbnpoZSBaaGFvIDxuenpoYW8uc2lnbWFAZ21haWwuY29tPiDk
uo4yMDI15bm0N+aciDEy5pel5ZGo5YWtIDE5OjM55YaZ6YGT77yaCj4+Cj4+IERlYXIgTXIgTWF0
dGhldwo+PiBIaSEgSXQncyBiZWVuIGEgbG9uZyB0aW1lIHNpbmNlIHdlIGxhc3QgZGlzY3VzcyBh
Ym91dCBmMmZzIHN1cHBvcnRpbmcKPj4gbGFyZ2UgZm9saW9zLiBJIGhvcGUgeW91J3JlIGRvaW5n
IHdlbGwhCj4+IE92ZXIgdGhlIHBhc3QgdGhyZWUgbW9udGhzLCBJJ3ZlIGJlZW4gd29ya2luZyBv
biBsYXJnZSBmb2xpb3Mgc3VwcG9ydAo+PiBpbiBteSBvd24gZm9yayBvZiB0aGUgZjJmcyB0cmVl
LiBJJ3ZlIG1hZGUgc29tZSBzaWduaWZpY2FudCBwcm9ncmVzcwo+PiBhbmQgaGF2ZSBhIHdvcmtp
bmcgaW1wbGVtZW50YXRpb24gZm9yOgo+PiAtIGYyZnMncyBvd24gcGVyIGZvbGlvIHN0cnVjdCBm
MmZzX2lvbWFwX2ZvbGlvX3N0YXRlCj4+IC0gaW9tYXAtYmFzZWQgYnVmZmVyZWQgcmVhZCBhbmQg
d3JpdGUuCj4+IC0gTGFyZ2UgZm9saW9zIHN1cHBvcnQgZm9yIGNvbXByZXNzZWQgZmlsZXMsIGlu
Y2x1ZGluZyBib3RoIGJ1ZmZlcmVkCj4+IEkvTyBhbmQgcGFnZSB3cml0ZWJhY2suCj4+IE15IHdv
cmsgaXMgYmFzZWQgb24gYSBzZXZlcmFsIGNvbW1pdHMganVzdCBhZnRlciB5b3VyICJmMmZzIGZv
bGlvCj4+IGNvbnZlcnNpb25zIGZvciA2LjE2IiBzZXJpZXMgb24gZjJmcydzIGRldi10ZXN0IGJy
YW5jaChOb3QgdGhlCj4+IG1haW5saW5lKSBJdCBjYW4gaGFuZGxlIHJ1biBvbiBzb21lIHNpbXBs
ZSByZWFkL3dyaXRlIG9wZXJhdGlvbnMgZm9yCj4+IGJvdGggbm9ybWFsIGFuZCBjb21wcmVzc2Vk
IGZpbGVzLCBidXQgaXQgaXMgc3RpbGwgbGFyZ2VseSB1bnRlc3RlZC4KPj4gWW91IGNhbiBmaW5k
IG15IFdJUCBicmFuY2ggaGVyZToKPj4gSSBzYXcgeW91ciByZWNlbnQgc2VyaWVzIG9mIHBhdGNo
ZXMgZm9yIGxhcmdlIGZvbGlvcyBzdXBwb3J0IGFuZCB3YXMKPj4gZXhjaXRlZCB0byBzZWUgdGhl
IHByb2dyZXNzLiBJJ20gd3JpdGluZyB0byB5b3UgdG9kYXkgdG8gc2hhcmUgYW4KPj4gdXBkYXRl
IGZyb20gbXkgc2lkZSBhbmQgYXNrIGZvciBzb21lIGd1aWRhbmNlLgo+PiBSZWdhcmRpbmcgb3Vy
IHByZXZpb3VzIGRpc2N1c3Npb24gYWJvdXQgc3RvcmluZyBleHRyYSBmMmZzIGZsYWdzIGluCj4+
IGZvbGlvLT5wcml2YXRlLCBJIGltcGxlbWVudGVkIGEgc29sdXRpb24gdXNpbmcgYSBuZXcKPj4g
ZjJmc19pb21hcF9mb2xpb19zdGF0ZSBzdHJ1Y3QgYW5kIHJlbGF0ZWQgQVBJcywgd2hpY2ggSSBw
bGFjZWQgaW4gbmV3Cj4+IGZpbGVzIChmMmZzX2lmcy5jLy5oKS4gTXkgZGVzaWduIG5vdCBvbmx5
IHN1cHBvcnRzIGxhcmdlIGZvbGlvcyBidXQKPj4gYWxzbyBtYWludGFpbnMgY29tcGF0aWJpbGl0
eSB3aXRoIG9yZGVyLTAgZGF0YSBhbmQgbWV0YWRhdGEgZm9saW9zCj4+IHdoaWNoIHN0b3Jpbmcg
dGhlIGYyZnMgcHJpdmF0ZSBmbGFncyBkaXJlY3RseSBpbgo+PiBmb2xpby0+cHJpdmF0ZS5pb21h
cF9mb2xpb19zdGF0ZSB3b24ndCBhbGxvY2F0ZSBmb3IgdGhlbS4gVGhlIG1lbW9yeQo+PiBsYXlv
dXQgb2YgbXkgc3RydWN0IGlzIGFsc28gY29tcGF0aWJsZSB3aXRoIGlvbWFwJ3MgaGVscGVycy5O
b3cgdGhpcwo+PiBwaWVjZSBvZiBjb2RlICBjb25mbGljdHMgd2l0aCB5b3VyIGxhdGVzdCBwYXRj
aGVzIHRoYXQgaW50cm9kdWNlCj4+IGZvbGlvX3NldF9mMmZzX2RhdGEuIEkgYXNzdW1lIHRoZSBz
dGFuZGFyZCBrZXJuZWwgZGV2ZWxvcG1lbnQgd29ya2Zsb3cKPj4gd291bGQgYmUgZm9yIG1lIHRv
IHJlYmFzZSBteSBsb2NhbCBicmFuY2ggb250byB5b3VyIGxhdGVzdCBjb21taXQgYW5kCj4+IHRo
ZW4gcmVmYWN0b3IgbXkgY29kZSB0byBhbGlnbiB3aXRoIHlvdXIgbmV3IEFQSS4gSXMgdGhhdCBj
b3JyZWN0PyBJCj4+IGFtIG1vcmUgdGhhbiBoYXBweSB0byBkbyBzbyBhbmQgYWRhcHQgbXkgaW1w
bGVtZW50YXRpb24uCj4+IE9uIGEgcmVsYXRlZCBub3RlLCBJIHJlY2VudGx5IGxlYXJuZWQgdGhh
dCBzdG9yYWdlIGVuZ2luZWVycyBmcm9tIHZpdm8KPj4gYWxzbyBpbXBsZW1lbnRlZCBpb21hcCBi
dWZmZXJlZCB3cml0ZSBhbmQgcGFnZSB3cml0ZWJhY2sgY29udmVyc2lvbnMKPj4gZm9yIGYyZnMg
bGFzdCB5ZWFyLiAoVGhlIGxhdHRlciBzaG9ja3MgbWUsIGFuZCBJJ2xsIGV4cGxhaW4gdGhlIHJl
YXNvbgo+PiBpbiBhIGZ1dHVyZSBjb252ZXJzYXRpb24pLiBUaGVpciB3b3JrIHNlZW1lZCBkb2Vz
bid0IGluY2x1ZGUgc3VwcG9ydAo+PiBmb3IgY29tcHJlc3NlZCBmaWxlIGxhcmdlIGZvbGlvcy4g
SXQgc2VlbXMgbmVjZXNzYXJ5IGZvciBtZSB0bwo+PiBjb29yZGluYXRlIHdpdGggdGhlbS4KPj4g
TG9va2luZyBhaGVhZCwgSSB1bmRlcnN0YW5kIHRoYXQgYSBmZWF0dXJlIG9mIHRoaXMgc2l6ZSBz
aG91bGQgYmUKPj4gc3VibWl0dGVkIGFzIGEgc2VyaWVzIG9mIHNtYWxsLCBsb2dpY2FsIHBhdGNo
ZXMgdG8gbWFrZSB0aGUgcmV2aWV3Cj4+IHByb2Nlc3MgZWFzaWVyLiBJIHdvdWxkIGJlIGdyYXRl
ZnVsIGZvciBhbnkgdGhvdWdodHMgeW91IG1pZ2h0IGhhdmUgb24KPj4gdGhpcyBhcHByb2FjaCBh
cyB3ZWxsLgo+Pgo+PiBBbnkgZmVlZGJhY2sgb24gbXkgd29yayBvciBhZHZpY2Ugb24gaG93IHRv
IHByb2NlZWQgd291bGQgYmUgZ3JlYXRseQo+PiBhcHByZWNpYXRlZC4KPj4KPj4gVGhhbmtzIGZv
ciB5b3VyIHRpbWUuCj4+Cj4+IEJlc3QgcmVnYXJkcy4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
