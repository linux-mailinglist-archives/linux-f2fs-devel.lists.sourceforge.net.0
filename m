Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13299C326A6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 04 Nov 2025 18:46:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBLLokDvOdjQtCsD+OlpugNHfOf6r+KIH9+EZxJRB4Q=; b=bpmIguiwnrKuseJzhfzlhWSIIK
	4FgTv7B8/L+fEO2MEJ7+aA+dpRCWyp/tXdWOn4XdI4Ay4RSo3U/iddN7nE7DXxDf6EmdWELpBIZuy
	k4E07R69YeE4z53iUlpCy1Z8/oT/Kpk38jNgiD25mj4gSCGV+dgus2YcGUyO/7AR3rAs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGL6l-0000Id-Kv;
	Tue, 04 Nov 2025 17:46:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joannelkoong@gmail.com>) id 1vGL6P-0000IH-DA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 17:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M6x1mMEr1ViK/4UEn7s/n9KiNBM26zd4bqgPz4hzX20=; b=N3P4CbWvYnvD0qFVkfZOzJtQUv
 s2hxmqGRkSFs6Ug4HTFoOO+JY4kOppqccHk1q6x/r86b58HwCtEXb8oE/UOcMFsulyZJxumBGJ0RV
 eLXUxL1BNW/YCIawwR4ddpUySw0oveLBvknHN79UpVGN58F9wG6D/hWTySZXR+tTlHC8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M6x1mMEr1ViK/4UEn7s/n9KiNBM26zd4bqgPz4hzX20=; b=mC0M4+tqnxfwf83lFshgJ/ZQd8
 Y/EOywrxgWDynEhJW3+OxwG5IKrwJyvlZTr255LEvWxwO0dsdsoGlxGRD92/aohcMzgtLV0T2j3rb
 Bamx2nq1JZcl1vl72mKliLNAiVOiRqF6RSTT+92CZWWfjMXVTCE1EkRdMEcuiqMKcH3U=;
Received: from mail-qk1-f171.google.com ([209.85.222.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vGL6N-0003DH-Kf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 17:45:53 +0000
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-88f2b29b651so565674885a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Nov 2025 09:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762278338; x=1762883138; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M6x1mMEr1ViK/4UEn7s/n9KiNBM26zd4bqgPz4hzX20=;
 b=h66JZT1mmbh3wd8EUxiC191m7uVRhEP6JSkMyMoaraV9Rd98Y9IYUYhRWmcTLRIuZQ
 rl4pqRt+JBfeRokPUydofRIISt7zU56aYmINRweRbhhINgshRMi1LjLStKUVMNRWMFB+
 /4m9MbwZCxZyIX6qAZ7N2NQ6otSruMfTqdCLVxrA5u0zcsH1fO7tYgz2QtrPg1yjT9Xq
 gkop1pZwmgashuRFGOu85k/DJW70H+2RCLSWA673DsexMJH7aZALO+c3HDAJy6x3gmq9
 3KHK9F0MdQ0fai9OeJzsTAURpCm5iWllvSuegcrIddKq1/AnqglH9sSzPlgbM1n8LYp0
 r1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762278338; x=1762883138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M6x1mMEr1ViK/4UEn7s/n9KiNBM26zd4bqgPz4hzX20=;
 b=BCZYZ9+hGznoMDsiqxGdGZDKb1NaCr6cjE8Hkzf8lv2QcgvAKr8SznhJpuTakstZQ3
 xslC93vcHzsPu+rpyNJorXyXQtTHoXzvzcIxZO6Ho/WhqHBjQMS9LZIeJieTEVzY7TS3
 ntuE+y3nAdMifXSSPtSqxL46XD+v9eVB/LyafhLvPDc5uFN/2Of7s6RZcTjkHB1hjh9F
 PN5Hyplby5vknT2WqNkYQbNXuw39AzPHIPBsHZifdd5vKdq6gznk/A2MfCZ9QjnntjJ7
 dlek2e7lCBC8HvNKn2Z1yRxNpo123ek8arnY8/OwwkMbOdhXXy14wNp94DRiXchdE/Bl
 BKiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIjBEjpH08DHiGEZzJ5S6sRz5DQXBjkpL+MmsqF/xhoFUTzsYbzSeh5iAgKugtmpYL0CF4eNPnVJHD4NdrF64M@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwrXlXl+ydcXlCxeYXCN/Avh0YNWenqaDQT7Zq8Z7O6OB2BTYp3
 7znU3vzHRApcI1GBr+lXUS7i8OrwaUoB+4Gvjln3JVnilLtPsPCXlaSdFdTY8moRMVWesC2K5Ut
 0GqR0a+QezVz6LR9kIsVWNa7d7g1FGwE=
X-Gm-Gg: ASbGncsCNkvUd/+V6nY+8U5HSFtitbB1mM6Vb8HX+ZdDWSTAIkw9CPpKiQyCIhZXIWo
 IUuwBE+cTa0uZJJ93dF4AHMEYIXloYpDdnXGBANGNRipbgUx8VVcCMaDn7/497dZfOuXFXvR0PZ
 /Is5Lxnm7t0oXvTzb4EZ9iKr/ariad45CN9+DuG5eYP16PwifhBOSEHUmBPLU3LWxQlUA/lINy4
 R7JziEt62+9N6vPguCZiMKcRnvmnZnIjrf1KmntwesNLNFKw3C/57Lgjwkb5JKqoAZi/jR5O/3f
 2g398ZAMk2hA98TgEnDMHOCI/Wc49SEl
X-Google-Smtp-Source: AGHT+IHIemEGumbWMvCLAES8ZvcTesT/uJ+/JeVAzhULJ3mU86DKceJjKHvDWF4VbBI6aTt9xr2jHTuPM+nQhLeXf3k=
X-Received: by 2002:a05:620a:44d1:b0:80d:9993:889d with SMTP id
 af79cd13be357-8b22083861fmr71066585a.20.1762278338264; Tue, 04 Nov 2025
 09:45:38 -0800 (PST)
MIME-Version: 1.0
References: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
 <69096836.a70a0220.88fb8.0006.GAE@google.com>
In-Reply-To: <69096836.a70a0220.88fb8.0006.GAE@google.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 4 Nov 2025 09:45:27 -0800
X-Gm-Features: AWmQ_bmsZ0FX7daxSTx60bXg7avbovxZmS1g2DtoGMxWSn0aBtqMvbz1O5rliIw
Message-ID: <CAJnrk1Yo4dRVSaPCaAGkHc+in03KaTXJ+KxckhLoSrRxbEdDBg@mail.gmail.com>
To: syzbot <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>, 
 "pmladek@suse.com" <pmladek@suse.com>, 
 "amurray@thegoodpenguin.co.uk" <amurray@thegoodpenguin.co.uk>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 3, 2025 at 6:43 PM syzbot wrote: > > Hello, >
 > syzbot has tested the proposed patch but the reproducer is still triggering
 an issue: > WARNING in get_data > > loop0: detected capacity c [...] 
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.171 listed in wl.mailspike.net]
X-Headers-End: 1vGL6N-0003DH-Kf
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

T24gTW9uLCBOb3YgMywgMjAyNSBhdCA2OjQz4oCvUE0gc3l6Ym90CjxzeXpib3QrMzY4Njc1ODY2
MGY5ODBiNDAyZGNAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywK
Pgo+IHN5emJvdCBoYXMgdGVzdGVkIHRoZSBwcm9wb3NlZCBwYXRjaCBidXQgdGhlIHJlcHJvZHVj
ZXIgaXMgc3RpbGwgdHJpZ2dlcmluZyBhbiBpc3N1ZToKPiBXQVJOSU5HIGluIGdldF9kYXRhCj4K
PiBsb29wMDogZGV0ZWN0ZWQgY2FwYWNpdHkgY2hhbmdlIGZyb20gMCB0byAxNgo+IC0tLS0tLS0t
LS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+IFdBUk5JTkc6IGtlcm5lbC9wcmludGsvcHJp
bnRrX3JpbmdidWZmZXIuYzoxMjc4IGF0IGdldF9kYXRhKzB4NDhhLzB4ODQwIGtlcm5lbC9wcmlu
dGsvcHJpbnRrX3JpbmdidWZmZXIuYzoxMjc4LCBDUFUjMTogc3l6LjAuNTg1Lzc2NTIKPiBNb2R1
bGVzIGxpbmtlZCBpbjoKPiBDUFU6IDEgVUlEOiAwIFBJRDogNzY1MiBDb21tOiBzeXouMC41ODUg
Tm90IHRhaW50ZWQgc3l6a2FsbGVyICMwIFBSRUVNUFQoZnVsbCkKPiBIYXJkd2FyZSBuYW1lOiBH
b29nbGUgR29vZ2xlIENvbXB1dGUgRW5naW5lL0dvb2dsZSBDb21wdXRlIEVuZ2luZSwgQklPUyBH
b29nbGUgMTAvMDIvMjAyNQo+IFJJUDogMDAxMDpnZXRfZGF0YSsweDQ4YS8weDg0MCBrZXJuZWwv
cHJpbnRrL3ByaW50a19yaW5nYnVmZmVyLmM6MTI3OAo+IENvZGU6IDgzIGM0IGY4IDQ4IGI4IDAw
IDAwIDAwIDAwIDAwIGZjIGZmIGRmIDQxIDBmIGI2IDA0IDA3IDg0IGMwIDBmIDg1IGVlIDAxIDAw
IDAwIDQ0IDg5IDY1IDAwIDQ5IDgzIGM1IDA4IGViIDEzIGU4IGE3IDE5IDFmIDAwIDkwIDwwZj4g
MGIgOTAgZWIgMDUgZTggOWMgMTkgMWYgMDAgNDUgMzEgZWQgNGMgODkgZTggNDggODMgYzQgMjgg
NWIgNDEKPiBSU1A6IDAwMTg6ZmZmZmM5MDAwMzUxNzBlMCBFRkxBR1M6IDAwMDEwMjkzCj4gUkFY
OiBmZmZmZmZmZjgxYTFlZWU5IFJCWDogMDAwMDNmZmZmZmZmZmZmZiBSQ1g6IGZmZmY4ODgwMzMy
NTViODAKPiBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwM2ZmZmZmZmZmZmZmIFJESTog
MDAwMDAwMDAwMDAwMDAwMAo+IFJCUDogMDAwMDAwMDAwMDAwMDAxMiBSMDg6IDAwMDAwMDAwMDAw
MDBlNTUgUjA5OiAwMDAwMDAzMjVlMjEzY2M3Cj4gUjEwOiAwMDAwMDAzMjVlMjEzY2M3IFIxMTog
MDAwMDFkZTRjMjAwMDAzNyBSMTI6IDAwMDAwMDAwMDAwMDAwMTIKPiBSMTM6IDAwMDAwMDAwMDAw
MDAwMDAgUjE0OiBmZmZmYzkwMDAzNTE3MjI4IFIxNTogMWZmZmZmZmZmMWJjYTY0Ngo+IEZTOiAg
MDAwMDdmNDRlYjhkYTZjMCgwMDAwKSBHUzpmZmZmODg4MTI1ZmRhMDAwKDAwMDApIGtubEdTOjAw
MDAwMDAwMDAwMDAwMDAKPiBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAw
MDgwMDUwMDMzCj4gQ1IyOiAwMDAwN2Y0NGVhOTcyMmUwIENSMzogMDAwMDAwMDA2NjM0NDAwMCBD
UjQ6IDAwMDAwMDAwMDAzNTI2ZjAKPiBDYWxsIFRyYWNlOgo+ICA8VEFTSz4KPiAgY29weV9kYXRh
IGtlcm5lbC9wcmludGsvcHJpbnRrX3JpbmdidWZmZXIuYzoxODU3IFtpbmxpbmVdCj4gIHByYl9y
ZWFkIGtlcm5lbC9wcmludGsvcHJpbnRrX3JpbmdidWZmZXIuYzoxOTY2IFtpbmxpbmVdCj4gIF9w
cmJfcmVhZF92YWxpZCsweDY3Mi8weGE5MCBrZXJuZWwvcHJpbnRrL3ByaW50a19yaW5nYnVmZmVy
LmM6MjE0Mwo+ICBwcmJfcmVhZF92YWxpZCsweDNjLzB4NjAga2VybmVsL3ByaW50ay9wcmludGtf
cmluZ2J1ZmZlci5jOjIyMTUKPiAgcHJpbnRrX2dldF9uZXh0X21lc3NhZ2UrMHgxNWMvMHg3YjAg
a2VybmVsL3ByaW50ay9wcmludGsuYzoyOTc4Cj4gIGNvbnNvbGVfZW1pdF9uZXh0X3JlY29yZCBr
ZXJuZWwvcHJpbnRrL3ByaW50ay5jOjMwNjIgW2lubGluZV0KPiAgY29uc29sZV9mbHVzaF9vbmVf
cmVjb3JkIGtlcm5lbC9wcmludGsvcHJpbnRrLmM6MzE5NCBbaW5saW5lXQo+ICBjb25zb2xlX2Zs
dXNoX2FsbCsweDRjYy8weGIxMCBrZXJuZWwvcHJpbnRrL3ByaW50ay5jOjMyNjgKPiAgX19jb25z
b2xlX2ZsdXNoX2FuZF91bmxvY2sga2VybmVsL3ByaW50ay9wcmludGsuYzozMjk4IFtpbmxpbmVd
Cj4gIGNvbnNvbGVfdW5sb2NrKzB4YmIvMHgxOTAga2VybmVsL3ByaW50ay9wcmludGsuYzozMzM4
Cj4gIHZwcmludGtfZW1pdCsweDRjNS8weDU5MCBrZXJuZWwvcHJpbnRrL3ByaW50ay5jOjI0MjMK
PiAgX3ByaW50aysweGNmLzB4MTIwIGtlcm5lbC9wcmludGsvcHJpbnRrLmM6MjQ0OAo+ICBfZXJv
ZnNfcHJpbnRrKzB4MzQ5LzB4NDEwIGZzL2Vyb2ZzL3N1cGVyLmM6MzMKPiAgZXJvZnNfZmNfZmls
bF9zdXBlcisweDE1OTEvMHgxYjIwIGZzL2Vyb2ZzL3N1cGVyLmM6NzQ2Cj4gIGdldF90cmVlX2Jk
ZXZfZmxhZ3MrMHg0MGUvMHg0ZDAgZnMvc3VwZXIuYzoxNjkyCj4gIHZmc19nZXRfdHJlZSsweDky
LzB4MmIwIGZzL3N1cGVyLmM6MTc1Mgo+ICBmY19tb3VudCBmcy9uYW1lc3BhY2UuYzoxMTk4IFtp
bmxpbmVdCj4gIGRvX25ld19tb3VudF9mYyBmcy9uYW1lc3BhY2UuYzozNjQxIFtpbmxpbmVdCj4g
IGRvX25ld19tb3VudCsweDMwMi8weGExMCBmcy9uYW1lc3BhY2UuYzozNzE3Cj4gIGRvX21vdW50
IGZzL25hbWVzcGFjZS5jOjQwNDAgW2lubGluZV0KPiAgX19kb19zeXNfbW91bnQgZnMvbmFtZXNw
YWNlLmM6NDIyOCBbaW5saW5lXQo+ICBfX3NlX3N5c19tb3VudCsweDMxMy8weDQxMCBmcy9uYW1l
c3BhY2UuYzo0MjA1Cj4gIGRvX3N5c2NhbGxfeDY0IGFyY2gveDg2L2VudHJ5L3N5c2NhbGxfNjQu
Yzo2MyBbaW5saW5lXQo+ICBkb19zeXNjYWxsXzY0KzB4ZmEvMHhmYTAgYXJjaC94ODYvZW50cnkv
c3lzY2FsbF82NC5jOjk0Cj4gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4
N2YKPiBSSVA6IDAwMzM6MHg3ZjQ0ZWE5OTA3NmEKPiBDb2RlOiBkOCA2NCA4OSAwMiA0OCBjNyBj
MCBmZiBmZiBmZiBmZiBlYiBhNiBlOCBkZSAxYSAwMCAwMCA2NiAyZSAwZiAxZiA4NCAwMCAwMCAw
MCAwMCAwMCAwZiAxZiA0MCAwMCA0OSA4OSBjYSBiOCBhNSAwMCAwMCAwMCAwZiAwNSA8NDg+IDNk
IDAxIGYwIGZmIGZmIDczIDAxIGMzIDQ4IGM3IGMxIGE4IGZmIGZmIGZmIGY3IGQ4IDY0IDg5IDAx
IDQ4Cj4gUlNQOiAwMDJiOjAwMDA3ZjQ0ZWI4ZDllNjggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JB
WDogMDAwMDAwMDAwMDAwMDBhNQo+IFJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDA3ZjQ0
ZWI4ZDllZjAgUkNYOiAwMDAwN2Y0NGVhOTkwNzZhCj4gUkRYOiAwMDAwMjAwMDAwMDAwMTgwIFJT
STogMDAwMDIwMDAwMDAwMDFjMCBSREk6IDAwMDA3ZjQ0ZWI4ZDllYjAKPiBSQlA6IDAwMDAyMDAw
MDAwMDAxODAgUjA4OiAwMDAwN2Y0NGViOGQ5ZWYwIFIwOTogMDAwMDAwMDAwMDAwMDAwMAo+IFIx
MDogMDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAyNDYgUjEyOiAwMDAwMjAwMDAw
MDAwMWMwCj4gUjEzOiAwMDAwN2Y0NGViOGQ5ZWIwIFIxNDogMDAwMDAwMDAwMDAwMDFhMSBSMTU6
IDAwMDAyMDAwMDAwMDAwODAKPiAgPC9UQVNLPgo+CgpUaGlzIGxvb2tzIHVucmVsYXRlZCB0byB0
aGUgaW9tYXAgY2hhbmdlcyBhbmQgc2VlbXMgdGllZCB0byB0aGUgcmVjZW50CnByaW50ayBjb25z
b2xlIGZsdXNoaW5nIGNoYW5nZXMuIEhtbSwgbWF5YmUgb25lIG9mIHRoZXNlIGNoYW5nZXMKWzEs
MiwzXT8KCmNjaW5nIEFuZHJldyBhbmQgUGV0ciwgd2hvIHdvdWxkIGtub3cgbW9yZQoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTAyMC1wcmludGtfbGVnYWN5X3RocmVhZF9j
b25zb2xlX2xvY2stdjMtMS0wMGYxZjBhYzA1NWFAdGhlZ29vZHBlbmd1aW4uY28udWsvClsyXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTEwMjAtcHJpbnRrX2xlZ2FjeV90aHJlYWRf
Y29uc29sZV9sb2NrLXYzLTItMDBmMWYwYWMwNTVhQHRoZWdvb2RwZW5ndWluLmNvLnVrLwpbM10g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMDIwLXByaW50a19sZWdhY3lfdGhyZWFk
X2NvbnNvbGVfbG9jay12My0zLTAwZjFmMGFjMDU1YUB0aGVnb29kcGVuZ3Vpbi5jby51ay8KClRo
YW5rcywKSm9hbm5lCgo+Cj4gVGVzdGVkIG9uOgo+Cj4gY29tbWl0OiAgICAgICAgIDk4MjMxMjA5
IEFkZCBsaW51eC1uZXh0IHNwZWNpZmljIGZpbGVzIGZvciAyMDI1MTEwMwo+IGdpdCB0cmVlOiAg
ICAgICBsaW51eC1uZXh0Cj4gY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNw
b3QuY29tL3gvbG9nLnR4dD94PTEzNzBhMjkyNTgwMDAwCj4ga2VybmVsIGNvbmZpZzogIGh0dHBz
Oi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PTQzY2MwZTMxNTU4Y2I1MjcKPiBk
YXNoYm9hcmQgbGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPTM2
ODY3NTg2NjBmOTgwYjQwMmRjCj4gY29tcGlsZXI6ICAgICAgIERlYmlhbiBjbGFuZyB2ZXJzaW9u
IDIwLjEuOCAoKysyMDI1MDcwODA2MzU1MSswYzlmOTA5Yjc5NzYtMX5leHAxfjIwMjUwNzA4MTgz
NzAyLjEzNiksIERlYmlhbiBMTEQgMjAuMS44Cj4KPiBOb3RlOiBubyBwYXRjaGVzIHdlcmUgYXBw
bGllZC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
