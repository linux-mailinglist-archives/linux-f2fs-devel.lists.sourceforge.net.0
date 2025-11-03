Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D096CC2D4DE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 17:59:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijO8uY4x4odsqLOXQ3Ut8jn48VFh4LjFPsoWEBtfPw8=; b=HdGti/1Z1Xxzzrpo9GwgEjICie
	c0FjbHFV6b+cYPUUOCBVJGlvY+eqKCYkq1wCsTssVLwSLB9lMu6/wBdZyvbpk4faq6t0qQC4uyNRt
	7mYkNFtzAOsLx9/UYw396x99CyViiZbP/q1e4nIRW6GUCM3k7zq3IxlvWAqb+H9ifId0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFxtE-0003h4-Ju;
	Mon, 03 Nov 2025 16:58:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joannelkoong@gmail.com>) id 1vFxtD-0003gv-3Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 16:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1mTsTlYaKlSyBQb/TNu3wRr8ckz09pUbjw64hL0b7SA=; b=P/tVIDCPPuZ5FfPdL7Y8Mhh241
 gZy5RrXRNyW74ZECh5V7fBEVre6yqi/5BGBTwX9HdsfKOOsif1Vz/ksGBqSqGe0cOzDoCYmojxuTB
 Tau+SQMBeZ8HnZ2ptxnGLlDyB5xkcZlVCE0qgclgcjmIy7Bw9C75PWZtJtil8A7/Tz5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1mTsTlYaKlSyBQb/TNu3wRr8ckz09pUbjw64hL0b7SA=; b=WWE29DFgjLpR2neTdYgiX6+RAH
 nMzd0xVKUx4TxjJZwVIeBBsEvZ/8tYTYPibYT0tHfhKwkZKyt7OEHmwgkYMk+3GievRKCyyNID0zk
 dYSu/2T1AGIEZLt9JNwfLBUAKimwhEo+cW9Vw64OyIXQhhmHZ0YmHBvCIfSB5agrRLvE=;
Received: from mail-qt1-f180.google.com ([209.85.160.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vFxtC-0002cM-GN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 16:58:43 +0000
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4ed59386345so4321921cf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Nov 2025 08:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762189111; x=1762793911; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1mTsTlYaKlSyBQb/TNu3wRr8ckz09pUbjw64hL0b7SA=;
 b=djfueXDSSNnUM2NrVw89Msc5j0GGHo4g/NskADVTx1Q/B3s17zuah/a3PaUabPXLVF
 orHtjpHydVkgkdhQS1d9d9fbj7DtDGSL/MVREL+fcStMUUjx3ip0eprZ+zifLC2t+lGN
 lZhXbeELdrKvNa0o+o/gSQ9FKh6UweDyk63oId0r/Pu3kojdtHFko2wGbj6RFYm+qrbJ
 UoM/IU7SOwaerXG4Dd7kbc3cj83SbXI9fi2lGSCNoeNnorrMkVbzh7POflmbFAEg3Z16
 8zJ/2xn5VBr+GK2Z0kx0pCCIi7dc34a3wWlg2b6+juxv/BLuXJx/an4HW86rsES6CrxJ
 5UEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762189111; x=1762793911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1mTsTlYaKlSyBQb/TNu3wRr8ckz09pUbjw64hL0b7SA=;
 b=Ivghmpd0tUW3kpW3Y4VJs4tWNyT9lhdpM6mdYiQwT5TF2b7028HRNgr5cxdoqvAmMX
 sPcaa/bCDiq0c66el1355UmI133/+rOriZP8qMr7f+ltDWm1W5JzpbI/G3WI+ThIF2Tp
 THa+/jfhO7fmcQ9X8E9qM3h46rVDcZlItKUZJPojk2uZW/P7i2+nOxrdKXrGvezUUlGV
 jjR6qK1I3v6/VgqEspbki45Vuk4Q02aQsQIiXCm98TF6rMFnXIfKoFbbO8S2MLwJPoUy
 XwDZjole6xPz33DQIj513naU34Qg+G1Kyl6G8kL/8sbHoY/EofRgU+4p+8CxA+wIKws7
 eYzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJOGMn7luAZYcgZPEeDKxbt524AIu257CVnxA1pLGzJt1gpYck7YRH9udTcQK3+s2DV1ss5qCC+5pwBpQvB6gR@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy/WiHh6pKW0b2FoQNlEFQyUjnAQYbYZhOoi9wGl9yEE6TIpTJU
 Qn97rzWgqnvfGsVuE8NiWZ4fcZIZ3w1eDdDE5JdbY7ZxhOFhbCSPDWOAlw9rTlCL4B1bdvYhz7t
 h9hx+FGvbAUghAV4y68uaeKff8hc8oqc=
X-Gm-Gg: ASbGncs45g96Na45pee0aafOwgiTQv69yCXD4xZ71Vm8rIJDdPoHDEXfDT4kWukAbY9
 Vgr1K8Eu3bTCB+2BjeGT7FnFxQLBIquQJ6o5Jc6ogqJ/t90KzWWhwLi5oZN6XD0En3qFbfSlKt2
 rxNEqZFqW2TFp4DVfs7rKDpRPf8N8MZmrYKmiL8xFVg0BZlXo4AMOletGsjYnCJ8QdRLbbA/XSH
 76J26uF9yrkNfZ6vZsS89YVfnFG0jcYyWDkyg6A3nv5fZw54j6RuwtLIRsTBst5hzBcBx24ydzv
 zRqGfmbiTQzwSvDpsDbDfsRruv93ZGLjt+FblQMaNUA=
X-Google-Smtp-Source: AGHT+IHyI72HABW//cHBarLcnu9+Ba1MPRR6bZ6mJXb7LBAoEIMFtTzlhgqDHkzZb+vCZHWzUpZ0aVzufuIm9gLbSlg=
X-Received: by 2002:ac8:7f81:0:b0:4e6:ef26:3152 with SMTP id
 d75a77b69052e-4ed310d1aa1mr166286551cf.80.1762189111384; Mon, 03 Nov 2025
 08:58:31 -0800 (PST)
MIME-Version: 1.0
References: <68cc0578.050a0220.28a605.0006.GAE@google.com>
 <69056c50.a70a0220.1e08cc.006c.GAE@google.com>
In-Reply-To: <69056c50.a70a0220.1e08cc.006c.GAE@google.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 3 Nov 2025 08:58:20 -0800
X-Gm-Features: AWmQ_bkDsSgdQVUGrhQNkWuvMPjtQkwEYu3HRdCHE9EaMTy5z14J08E7zjkious
Message-ID: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
To: syzbot <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Nov 1, 2025 at 1:26 PM syzbot wrote: > > syzbot has
 found a reproducer for the following issue on: > > HEAD commit: 98bd8b16ae57
 Add linux-next specific files for 20251031 > git tree: linux- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [joannelkoong(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vFxtC-0002cM-GN
Subject: Re: [f2fs-dev] [syzbot] [iomap?] kernel BUG in folio_end_read (2)
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
Cc: brauner@kernel.org, djwong@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU2F0LCBOb3YgMSwgMjAyNSBhdCAxOjI24oCvUE0gc3l6Ym90CjxzeXpib3QrMzY4Njc1ODY2
MGY5ODBiNDAyZGNAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbT4gd3JvdGU6Cj4KPiBzeXpib3Qg
aGFzIGZvdW5kIGEgcmVwcm9kdWNlciBmb3IgdGhlIGZvbGxvd2luZyBpc3N1ZSBvbjoKPgo+IEhF
QUQgY29tbWl0OiAgICA5OGJkOGIxNmFlNTcgQWRkIGxpbnV4LW5leHQgc3BlY2lmaWMgZmlsZXMg
Zm9yIDIwMjUxMDMxCj4gZ2l0IHRyZWU6ICAgICAgIGxpbnV4LW5leHQKPiBjb25zb2xlIG91dHB1
dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9MTYzYjJiY2Q5ODAw
MDAKPiBrZXJuZWwgY29uZmlnOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC8uY29u
ZmlnP3g9NjNkMDk3MjVjOTNiY2MxYwo+IGRhc2hib2FyZCBsaW5rOiBodHRwczovL3N5emthbGxl
ci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9MzY4Njc1ODY2MGY5ODBiNDAyZGMKPiBjb21waWxlcjog
ICAgICAgRGViaWFuIGNsYW5nIHZlcnNpb24gMjAuMS44ICgrKzIwMjUwNzA4MDYzNTUxKzBjOWY5
MDliNzk3Ni0xfmV4cDF+MjAyNTA3MDgxODM3MDIuMTM2KSwgRGViaWFuIExMRCAyMC4xLjgKPiBz
eXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5zeXo/
eD0xNzZmYzM0MjU4MDAwMAo+IEMgcmVwcm9kdWNlcjogICBodHRwczovL3N5emthbGxlci5hcHBz
cG90LmNvbS94L3JlcHJvLmM/eD0xMDQwM2YzNDU4MDAwMAo+Cj4gRG93bmxvYWRhYmxlIGFzc2V0
czoKPiBkaXNrIGltYWdlOiBodHRwczovL3N0b3JhZ2UuZ29vZ2xlYXBpcy5jb20vc3l6Ym90LWFz
c2V0cy85NzUyNjE3NDZmMjkvZGlzay05OGJkOGIxNi5yYXcueHoKPiB2bWxpbnV4OiBodHRwczov
L3N0b3JhZ2UuZ29vZ2xlYXBpcy5jb20vc3l6Ym90LWFzc2V0cy9hZDU2NWM2Y2YyNzIvdm1saW51
eC05OGJkOGIxNi54ego+IGtlcm5lbCBpbWFnZTogaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMu
Y29tL3N5emJvdC1hc3NldHMvMTgxNmE1NWE4ZDVmL2J6SW1hZ2UtOThiZDhiMTYueHoKPiBtb3Vu
dGVkIGluIHJlcHJvOiBodHRwczovL3N0b3JhZ2UuZ29vZ2xlYXBpcy5jb20vc3l6Ym90LWFzc2V0
cy9kNmQ5ZWVlMzFmZGIvbW91bnRfMC5nego+ICAgZnNjayByZXN1bHQ6IGZhaWxlZCAobG9nOiBo
dHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2ZzY2subG9nP3g9MTc4MDNmMzQ1ODAwMDAp
Cj4KPiBJTVBPUlRBTlQ6IGlmIHlvdSBmaXggdGhlIGlzc3VlLCBwbGVhc2UgYWRkIHRoZSBmb2xs
b3dpbmcgdGFnIHRvIHRoZSBjb21taXQ6Cj4gUmVwb3J0ZWQtYnk6IHN5emJvdCszNjg2NzU4NjYw
Zjk4MGI0MDJkY0BzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4KPiAgdm1zX2NvbXBsZXRlX211
bm1hcF92bWFzKzB4MjA2LzB4OGEwIG1tL3ZtYS5jOjEyNzkKPiAgZG9fdm1pX2FsaWduX211bm1h
cCsweDM2NC8weDQ0MCBtbS92bWEuYzoxNTM4Cj4gIGRvX3ZtaV9tdW5tYXArMHgyNTMvMHgyZTAg
bW0vdm1hLmM6MTU4Ngo+ICBfX3ZtX211bm1hcCsweDIwNy8weDM4MCBtbS92bWEuYzozMTk2Cj4g
IF9fZG9fc3lzX211bm1hcCBtbS9tbWFwLmM6MTA3NyBbaW5saW5lXQo+ICBfX3NlX3N5c19tdW5t
YXAgbW0vbW1hcC5jOjEwNzQgW2lubGluZV0KPiAgX194NjRfc3lzX211bm1hcCsweDYwLzB4NzAg
bW0vbW1hcC5jOjEwNzQKPiAgZG9fc3lzY2FsbF94NjQgYXJjaC94ODYvZW50cnkvc3lzY2FsbF82
NC5jOjYzIFtpbmxpbmVdCj4gIGRvX3N5c2NhbGxfNjQrMHhmYS8weGZhMCBhcmNoL3g4Ni9lbnRy
eS9zeXNjYWxsXzY0LmM6OTQKPiAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4Nzcv
MHg3Zgo+IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+IGtlcm5lbCBCVUcg
YXQgbW0vZmlsZW1hcC5jOjE1MzAhCgpJIHRoaW5rIHRoaXMgaXMgdGhlIHNhbWUgYnVnIHRoYXQg
d2FzIGZpeGVkIGJ5IFsxXS4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mc2Rl
dmVsLzIwMjUxMDMxMjExMzA5LjE3NzQ4MTktMi1qb2FubmVsa29vbmdAZ21haWwuY29tLwoKPiBP
b3BzOiBpbnZhbGlkIG9wY29kZTogMDAwMCBbIzFdIFNNUCBLQVNBTiBQVEkKPiBDUFU6IDEgVUlE
OiAwIFBJRDogNTk4OSBDb21tOiBzeXouMC4xNyBOb3QgdGFpbnRlZCBzeXprYWxsZXIgIzAgUFJF
RU1QVChmdWxsKQo+IEhhcmR3YXJlIG5hbWU6IEdvb2dsZSBHb29nbGUgQ29tcHV0ZSBFbmdpbmUv
R29vZ2xlIENvbXB1dGUgRW5naW5lLCBCSU9TIEdvb2dsZSAxMC8wMi8yMDI1Cj4gUklQOiAwMDEw
OmZvbGlvX2VuZF9yZWFkKzB4MWU5LzB4MjMwIG1tL2ZpbGVtYXAuYzoxNTMwCj4gQ29kZTogNzkg
YzcgZmYgNDggODkgZGYgNDggYzcgYzYgMjAgNmQgNzQgOGIgZTggOWYgZGYgMmUgZmYgOTAgMGYg
MGIgZTggZDcgNzkgYzcgZmYgNDggODkgZGYgNDggYzcgYzYgNDAgNjMgNzQgOGIgZTggODggZGYg
MmUgZmYgOTAgPDBmPiAwYiBlOCBjMCA3OSBjNyBmZiA0OCA4OSBkZiA0OCBjNyBjNiAyMCA2ZCA3
NCA4YiBlOCA3MSBkZiAyZSBmZgo+IFJTUDogMDAxODpmZmZmYzkwMDAzZjhlMjY4IEVGTEFHUzog
MDAwMTAyNDYKPiBSQVg6IGM2OTA0ZmYzMzg3ZGI3MDAgUkJYOiBmZmZmZWEwMDAxYjVlZjAwIFJD
WDogMDAwMDAwMDAwMDAwMDAwMAo+IFJEWDogMDAwMDAwMDAwMDAwMDAwNyBSU0k6IGZmZmZmZmZm
OGQ3ODBhMWIgUkRJOiAwMDAwMDAwMGZmZmZmZmZmCj4gUkJQOiAwMDAwMDAwMDAwMDAwMDAwIFIw
ODogZmZmZmZmZmY4ZjdkNzQ3NyBSMDk6IDFmZmZmZmZmZjFlZmFlOGUKPiBSMTA6IGRmZmZmYzAw
MDAwMDAwMDAgUjExOiBmZmZmZmJmZmYxZWZhZThmIFIxMjogMWZmZmZkNDAwMDM2YmRlMQo+IFIx
MzogMWZmZmZkNDAwMDM2YmRlMCBSMTQ6IGZmZmZlYTAwMDFiNWVmMDggUjE1OiAwMGZmZjIwMDAw
MDA0MDYwCj4gRlM6ICAwMDAwNTU1NTcyMzMzNTAwKDAwMDApIEdTOmZmZmY4ODgxMjVmZTIwMDAo
MDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMAo+IENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAw
MCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPiBDUjI6IDAwMDA3ZjU3ZDY4NDQwMDAgQ1IzOiAwMDAw
MDAwMDc1NTg2MDAwIENSNDogMDAwMDAwMDAwMDM1MjZmMAo+IENhbGwgVHJhY2U6Cj4gIDxUQVNL
Pgo+ICBpb21hcF9yZWFkYWhlYWQrMHg5NmEvMHhiYzAgZnMvaW9tYXAvYnVmZmVyZWQtaW8uYzo1
NDcKPiAgaW9tYXBfYmlvX3JlYWRhaGVhZCBpbmNsdWRlL2xpbnV4L2lvbWFwLmg6NjA4IFtpbmxp
bmVdCj4gIGVyb2ZzX3JlYWRhaGVhZCsweDFjMy8weDNjMCBmcy9lcm9mcy9kYXRhLmM6MzgzCj4g
IHJlYWRfcGFnZXMrMHgxN2EvMHg1ODAgbW0vcmVhZGFoZWFkLmM6MTYzCj4gIHBhZ2VfY2FjaGVf
cmFfb3JkZXIrMHg5MjQvMHhlNzAgbW0vcmVhZGFoZWFkLmM6NTE4Cj4gIGZpbGVtYXBfcmVhZGFo
ZWFkIG1tL2ZpbGVtYXAuYzoyNjU4IFtpbmxpbmVdCj4gIGZpbGVtYXBfZ2V0X3BhZ2VzKzB4N2Zm
LzB4MWRmMCBtbS9maWxlbWFwLmM6MjcwNAo+ICBmaWxlbWFwX3JlYWQrMHgzZjYvMHgxMWEwIG1t
L2ZpbGVtYXAuYzoyODAwCj4gIF9fa2VybmVsX3JlYWQrMHg0Y2YvMHg5NjAgZnMvcmVhZF93cml0
ZS5jOjUzMAo+ICBpbnRlZ3JpdHlfa2VybmVsX3JlYWQrMHg4OS8weGQwIHNlY3VyaXR5L2ludGVn
cml0eS9paW50LmM6MjgKPiAgaW1hX2NhbGNfZmlsZV9oYXNoX3RmbSBzZWN1cml0eS9pbnRlZ3Jp
dHkvaW1hL2ltYV9jcnlwdG8uYzo0ODAgW2lubGluZV0KPiAgaW1hX2NhbGNfZmlsZV9zaGFzaCBz
ZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9jcnlwdG8uYzo1MTEgW2lubGluZV0KPiAgaW1hX2Nh
bGNfZmlsZV9oYXNoKzB4ODVlLzB4MTZmMCBzZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9jcnlw
dG8uYzo1NjgKPiAgaW1hX2NvbGxlY3RfbWVhc3VyZW1lbnQrMHg0MjgvMHg4ZjAgc2VjdXJpdHkv
aW50ZWdyaXR5L2ltYS9pbWFfYXBpLmM6MjkzCj4gIHByb2Nlc3NfbWVhc3VyZW1lbnQrMHgxMTIx
LzB4MWE0MCBzZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9tYWluLmM6NDA1Cj4gIGltYV9maWxl
X2NoZWNrKzB4ZDcvMHgxMjAgc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS9pbWFfbWFpbi5jOjY1Ngo+
ICBzZWN1cml0eV9maWxlX3Bvc3Rfb3BlbisweGJiLzB4MjkwIHNlY3VyaXR5L3NlY3VyaXR5LmM6
MjY1Mgo+ICBkb19vcGVuIGZzL25hbWVpLmM6Mzk3NyBbaW5saW5lXQo+ICBwYXRoX29wZW5hdCsw
eDJmMjYvMHgzODMwIGZzL25hbWVpLmM6NDEzNAo+ICBkb19maWxwX29wZW4rMHgxZmEvMHg0MTAg
ZnMvbmFtZWkuYzo0MTYxCj4gIGRvX3N5c19vcGVuYXQyKzB4MTIxLzB4MWMwIGZzL29wZW4uYzox
NDM3Cj4gIGRvX3N5c19vcGVuIGZzL29wZW4uYzoxNDUyIFtpbmxpbmVdCj4gIF9fZG9fc3lzX29w
ZW5hdCBmcy9vcGVuLmM6MTQ2OCBbaW5saW5lXQo+ICBfX3NlX3N5c19vcGVuYXQgZnMvb3Blbi5j
OjE0NjMgW2lubGluZV0KPiAgX194NjRfc3lzX29wZW5hdCsweDEzOC8weDE3MCBmcy9vcGVuLmM6
MTQ2Mwo+ICBkb19zeXNjYWxsX3g2NCBhcmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzY0LmM6NjMgW2lu
bGluZV0KPiAgZG9fc3lzY2FsbF82NCsweGZhLzB4ZmEwIGFyY2gveDg2L2VudHJ5L3N5c2NhbGxf
NjQuYzo5NAo+ICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3Ny8weDdmCj4gUklQ
OiAwMDMzOjB4N2YwYjA4ZDhlZmM5Cj4gQ29kZTogZmYgZmYgYzMgNjYgMmUgMGYgMWYgODQgMDAg
MDAgMDAgMDAgMDAgMGYgMWYgNDAgMDAgNDggODkgZjggNDggODkgZjcgNDggODkgZDYgNDggODkg
Y2EgNGQgODkgYzIgNGQgODkgYzggNGMgOGIgNGMgMjQgMDggMGYgMDUgPDQ4PiAzZCAwMSBmMCBm
ZiBmZiA3MyAwMSBjMyA0OCBjNyBjMSBhOCBmZiBmZiBmZiBmNyBkOCA2NCA4OSAwMSA0OAo+IFJT
UDogMDAyYjowMDAwN2ZmZWM2YTVkMjY4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAw
MDAwMDAwMDAxMDEKPiBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwN2YwYjA4ZmU1ZmEw
IFJDWDogMDAwMDdmMGIwOGQ4ZWZjOQo+IFJEWDogMDAwMDAwMDAwMDEyMTE0MCBSU0k6IDAwMDAy
MDAwMDAwMDAwMDAgUkRJOiBmZmZmZmZmZmZmZmZmZjljCj4gUkJQOiAwMDAwN2YwYjA4ZTExZjkx
IFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDAKPiBSMTA6IDAwMDAw
MDAwMDAwMDAxM2QgUjExOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMjogMDAwMDAwMDAwMDAwMDAwMAo+
IFIxMzogMDAwMDdmMGIwOGZlNWZhMCBSMTQ6IDAwMDA3ZjBiMDhmZTVmYTAgUjE1OiAwMDAwMDAw
MDAwMDAwMDA0Cj4gIDwvVEFTSz4KPiBNb2R1bGVzIGxpbmtlZCBpbjoKPiAtLS1bIGVuZCB0cmFj
ZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPiBSSVA6IDAwMTA6Zm9saW9fZW5kX3JlYWQrMHgxZTkv
MHgyMzAgbW0vZmlsZW1hcC5jOjE1MzAKPiBDb2RlOiA3OSBjNyBmZiA0OCA4OSBkZiA0OCBjNyBj
NiAyMCA2ZCA3NCA4YiBlOCA5ZiBkZiAyZSBmZiA5MCAwZiAwYiBlOCBkNyA3OSBjNyBmZiA0OCA4
OSBkZiA0OCBjNyBjNiA0MCA2MyA3NCA4YiBlOCA4OCBkZiAyZSBmZiA5MCA8MGY+IDBiIGU4IGMw
IDc5IGM3IGZmIDQ4IDg5IGRmIDQ4IGM3IGM2IDIwIDZkIDc0IDhiIGU4IDcxIGRmIDJlIGZmCj4g
UlNQOiAwMDE4OmZmZmZjOTAwMDNmOGUyNjggRUZMQUdTOiAwMDAxMDI0Ngo+IFJBWDogYzY5MDRm
ZjMzODdkYjcwMCBSQlg6IGZmZmZlYTAwMDFiNWVmMDAgUkNYOiAwMDAwMDAwMDAwMDAwMDAwCj4g
UkRYOiAwMDAwMDAwMDAwMDAwMDA3IFJTSTogZmZmZmZmZmY4ZDc4MGExYiBSREk6IDAwMDAwMDAw
ZmZmZmZmZmYKPiBSQlA6IDAwMDAwMDAwMDAwMDAwMDAgUjA4OiBmZmZmZmZmZjhmN2Q3NDc3IFIw
OTogMWZmZmZmZmZmMWVmYWU4ZQo+IFIxMDogZGZmZmZjMDAwMDAwMDAwMCBSMTE6IGZmZmZmYmZm
ZjFlZmFlOGYgUjEyOiAxZmZmZmQ0MDAwMzZiZGUxCj4gUjEzOiAxZmZmZmQ0MDAwMzZiZGUwIFIx
NDogZmZmZmVhMDAwMWI1ZWYwOCBSMTU6IDAwZmZmMjAwMDAwMDQwNjAKPiBGUzogIDAwMDA1NTU1
NzIzMzM1MDAoMDAwMCkgR1M6ZmZmZjg4ODEyNWVlMjAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAw
MDAwMDAwCj4gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAz
Mwo+IENSMjogMDAwMDAwMWIzMDA2M2ZmZiBDUjM6IDAwMDAwMDAwNzU1ODYwMDAgQ1I0OiAwMDAw
MDAwMDAwMzUyNmYwCj4KPgo+IC0tLQo+IElmIHlvdSB3YW50IHN5emJvdCB0byBydW4gdGhlIHJl
cHJvZHVjZXIsIHJlcGx5IHdpdGg6Cj4gI3N5eiB0ZXN0OiBnaXQ6Ly9yZXBvL2FkZHJlc3MuZ2l0
IGJyYW5jaC1vci1jb21taXQtaGFzaAo+IElmIHlvdSBhdHRhY2ggb3IgcGFzdGUgYSBnaXQgcGF0
Y2gsIHN5emJvdCB3aWxsIGFwcGx5IGl0IGJlZm9yZSB0ZXN0aW5nLgo+Cgojc3l6IHRlc3Q6IGdp
dDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5l
eHQuZ2l0Cm1hc3RlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
