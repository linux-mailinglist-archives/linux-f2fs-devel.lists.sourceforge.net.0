Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C63CE6088
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Dec 2025 07:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+HJXfedAF/WsHAMoNLr3VPMwJ7gO4XBVhlDNy/fWjuI=; b=EPjkFW39qFlS6Q3pZAxj1VF8n5
	XRfUWv71mH728zPVA4V/n7DmNsEVYN1aelwKjQ6zeD5Wu+zISo5QwcdUbsgggzoWtjfZ0h6qBrpDw
	xX+OpgFw0/Ows6P1BdM/+BpEIqL2padfcFZiFvmPj8l869xBSFiw921os4a4KeY0SFN8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1va6pW-0002Bv-B4;
	Mon, 29 Dec 2025 06:34:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jeuk20.kim@gmail.com>) id 1va6pU-0002Bn-Ph
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Dec 2025 06:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hdby11lc82X6ksD2ulRMREaeD0v3pR30ShU0r6kwPz4=; b=MMZYid2dj3hyRLH4JG69OP120y
 bbiLwgM1MNBmV0zw8CS+QTUlfwSHU1MdTmvWugS1ap7OVswb8488hQD+D8sbI2hXhfpGA/+xc46fh
 xic9YoQTdy04eC30NTY8XMKJaG1tfCJNDxy3/BOongJ01rK67rl8gHXR7to0gbU0K/Zs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Hdby11lc82X6ksD2ulRMREaeD0v3pR30ShU0r6kwPz4=; b=B
 Iss5WhtZgx/eEQDFTkfjy9zEqrVuLp6hI7macPWUo0B5ruMsNoMlCN1+CPMLcL+bnskPyshJtZ7z2
 kYxZfOJ0m/yvmssF9UYM2X3gGnkPk+Qabpm2zddCKeZYHy5dRCOb+KnlIcbOP3NKl80gzN5jy21r5
 1PEsCLJI7KCk/w30=;
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1va6pU-00012n-EB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Dec 2025 06:34:08 +0000
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-64b83949fdaso11690443a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Dec 2025 22:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766990037; x=1767594837; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hdby11lc82X6ksD2ulRMREaeD0v3pR30ShU0r6kwPz4=;
 b=LgR73Srm1UliNAtQC+6yCA+ceZPxo4FTwykx1jaBBQzeX2IZ90nZNjXU8Bhu3j6q1q
 +ClcDg2RGwi/D8N8nnUyAvqabRCh13bOUIPIPmDGZmP8mVnrMY7okBLHz+vUs1Rc/YsK
 E0IX8S9L1sl+BkqT8/mvIv18njJmocBdVdQpz0wghoPcPiQYK1H4Z/qoGx7JYdmtEVA6
 BFSXORR9Ujuf7J8Y5tImM/QahBnTeFeinopg7mobt9YW1DgS1J8xa2XiFBEDnaamT0TL
 FE3nFImb/XBKHcpNbe4MxMdg6SDnAYfL2eIkjTWcgEEOUtuj3lSXSDAdSikG/0m/pb3T
 fpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766990037; x=1767594837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hdby11lc82X6ksD2ulRMREaeD0v3pR30ShU0r6kwPz4=;
 b=hps7j6Haet5Fj+2plTEKkD631w0zcfjln5lRv1ujhgydTWi+ivFUbsvpJoS4nBJ2UU
 HPQQdkCr5QeijK1EiAFBuSXO2kAJaxSCkdXFynzf/o3JZh//NSJL0cdyGHcQQ5VlrgTz
 EP82gzdPpA9+V3AWmcfOdwpfPEDFb0mbEmPX3PFf+iek+Q1Pin9t1brGbN7/Kr3JGixJ
 M9a2h8CQP7ST+V4OkAHpoKTuJLlrmyD25eElpZxVrbhDxV94jupsfMgA7adAUocqGzgw
 CmgXHe0q9b3EXjS7hWcoyHF4Xk7vZCc20sbUltXx3Fxx++47Fiu+fmjQKJrog9Vr2irE
 v2AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmplMoOys6LL1QW2BGHkP8LX1n5eZcCP6s82PYQjcoKZZV7mGsGByYELQc1J+pC6SrrypKrdyQ/T7k/L7DB7Oq@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxJ2rECxEAOM2VdM3LrnrIlA5VINba4houo8p8f9U6Bqss+6JGw
 PbVGVf5hWJmYgKxOI130Ao0N6cHZkLnjcS4g3F29bQlF1qsB1hQSXZFURKo4ZBBECNNcfyQuimQ
 g3pw8EtEJ2kg/PgFfP94p+LBgdqRgbk0=
X-Gm-Gg: AY/fxX6BljooH7sTl+J0CIRdUCh2XPLlPBTGZ4HrykgnqMnfnpbNL5YYyhve7HGUYlp
 dYTIkHOBJWuY4Ywu59tQVopFB35OwSHgBJQF1IjkdufuZvpfGuutWPk1zmNOhjiL8tiS1vUCwtw
 2IFYrHcTaXenJlneYNlgm3J/+jKRzHQ+0uABvNxy5RtFzXg2HHypSSpxL91CvbGg5o4aFyAiZiX
 lJ6CHrDkERo0HHhs4Q/q2WLHP1v8dSuAn1A4tbVEQaD/wjk5Bc3UXPzcSsP6OqD2FkfkfBgVUVB
 /MQ/uQ==
X-Google-Smtp-Source: AGHT+IFdLsQWvSoFb5US5GeYzrnHBvLhVZK9rRN3pJQqIsdIOrKabMSbsI2sR8VN08SvjerqQ+Q8n6HjyV9tDxItO4E=
X-Received: by 2002:a05:6402:4405:b0:64d:1762:9ba2 with SMTP id
 4fb4d7f45d1cf-64d1762a69cmr29303444a12.13.1766990036737; Sun, 28 Dec 2025
 22:33:56 -0800 (PST)
MIME-Version: 1.0
From: Jeuk Kim <jeuk20.kim@gmail.com>
Date: Mon, 29 Dec 2025 15:33:45 +0900
X-Gm-Features: AQt7F2o-napfN_0obbG5VttJ7y8zEgDo0e3dMG7eZ4fwgM6Qrgky8o6zRk32QGo
Message-ID: <CAPjHTeSsvb7UOAn9mWoqXwWTw1J9SEEDo1k=8KVcAxwVsys+Og@mail.gmail.com>
To: jaegeuk@kernel.org, Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi F2FS maintainers, Sorry for the duplicate — I’m resending
    this because the previous message was sent in HTML format. I’ve been looking
    into the DIO allocation path in f2fs, specifically when a DIO write needs
    to allocate new blocks (e.g., hole-filling). From f2fs_map_blocks() through
    __allocate_data_block() → f2 [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [jeuk20.kim(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.50 listed in wl.mailspike.net]
X-Headers-End: 1va6pU-00012n-EB
Subject: [f2fs-dev] Question: batching block allocation in f2fs DIO path
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jeuk Kim <jeuk20.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgRjJGUyBtYWludGFpbmVycywKClNvcnJ5IGZvciB0aGUgZHVwbGljYXRlIOKAlCBJ4oCZbSBy
ZXNlbmRpbmcgdGhpcyBiZWNhdXNlIHRoZSBwcmV2aW91cwptZXNzYWdlIHdhcyBzZW50IGluIEhU
TUwgZm9ybWF0LgoKSeKAmXZlIGJlZW4gbG9va2luZyBpbnRvIHRoZSBESU8gYWxsb2NhdGlvbiBw
YXRoIGluIGYyZnMsIHNwZWNpZmljYWxseQp3aGVuIGEgRElPIHdyaXRlIG5lZWRzIHRvIGFsbG9j
YXRlIG5ldyBibG9ja3MgKGUuZy4sIGhvbGUtZmlsbGluZykuCkZyb20gZjJmc19tYXBfYmxvY2tz
KCkgdGhyb3VnaCBfX2FsbG9jYXRlX2RhdGFfYmxvY2soKSDihpIKZjJmc19hbGxvY2F0ZV9kYXRh
X2Jsb2NrKCksIGl0IHNlZW1zIGVhY2ggYmxvY2sgYWxsb2NhdGlvbiBpcyBoYW5kbGVkCm9uZS1i
eS1vbmUsIHRha2luZyBjdXJzZWdfbG9jay9jdXJzZWdfbXV0ZXggYW5kIHRoZSBTSVQgc2VudHJ5
IGxvY2sKcGVyIGJsb2NrLgoKSeKAmW0gd29uZGVyaW5nIHdoZXRoZXIgYmF0Y2hpbmcgYWxsb2Nh
dGlvbnMgKGEgYm91bmRlZCBiYXRjaCwgZS5nLiwgYQpzbWFsbCBydW4gd2l0aGluIHRoZSBjdXJy
ZW50IHNlZ21lbnQpIGNvdWxkIGJlIGZlYXNpYmxlIGluIHRoZSBESU8KcGF0aC4gTXkgaW50dWl0
aW9uIGlzIHRoYXQgd2l0aCBtdWx0aXBsZSB0aHJlYWRzIGRvaW5nIERJTywgcmVkdWNpbmcKcGVy
LWJsb2NrIGxvY2sgY29udGVudGlvbiBhbmQgaW1wcm92aW5nIHNlcXVlbnRpYWxpdHkgY291bGQg
aGVscAp0aHJvdWdocHV0LgoKUXVlc3Rpb25zOgoKSXMgdGhlcmUgYSB0ZWNobmljYWwgb3IgY29y
cmVjdG5lc3MgcmVhc29uIHRoYXQgbWFrZXMgYmF0Y2hpbmcgZm9yIERJTwppbmZlYXNpYmxlIChl
LmcuLCBMRlMvU1NSL0dDIGludGVyYWN0aW9ucywgc3VtbWFyeS9TSVQgdXBkYXRlCm9yZGVyaW5n
LCBldGMuKT8KCk9yIGlzIHRoaXMgc2ltcGx5IGFuIG9wdGltaXphdGlvbiB0aGF0IGhhc27igJl0
IGJlZW4gaW1wbGVtZW50ZWQ/CgpJZiB0aGlzIHNlZW1zIGFjY2VwdGFibGUsIHdvdWxkIHlvdSBj
b25zaWRlciBwYXRjaGVzIGluIHRoaXMgZGlyZWN0aW9uPwoKSWYgdGhlcmUgYXJlIHByaW9yIGRp
c2N1c3Npb25zIG9yIGtub3duIGlzc3VlcyBvbiB0aGlzLCBJ4oCZZCBhcHByZWNpYXRlIHBvaW50
ZXJzLgoKVGhhbmtzIGZvciB5b3VyIHRpbWUuCgpCZXN0IHJlZ2FyZHMsCkpldWsgS2ltCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
