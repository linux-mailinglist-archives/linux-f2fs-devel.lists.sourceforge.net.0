Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 512E6AE2C41
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Jun 2025 22:29:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2O1d2n0gx1iPxu4oZsz5dPj+ntnPRnrtAloF7jTUrk=; b=jkIVUdyCcrvMocYJxFJvjgFDpX
	mfyiWQG+n2I2pYKKWqsgYXPcQgThL91ymXUcsdDJsiVFCKGBu3CbBIiF2MOtSfH5RK6okupSrDFn9
	UPOurJMjXbCVdv4No8eEeemjdyym3SExDpbKIdsbSc2t0mS2G+zpnhYoH60FYz1UkuWs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uT4qQ-0004sR-OB;
	Sat, 21 Jun 2025 20:29:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1uT4qP-0004sL-B4
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jun 2025 20:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JYGbOWijyFWRJxaIoRd32kLM2iySzUulbp7KNqKGivQ=; b=e7BH12avwHVbCZh9LkICI66asy
 RnF/r2N4CsAt1HrVVlY0MEkYDQkNdDk7OMBJfL+xfDUepaR9hnSvtqS94/3zfuQGPVhHQpLxIAiZg
 W3YdN8qGva+XgUEUk3pRATDQclARXnud6pjsERxDuD0XTjH8J556seKCCKOX0ONBu5QM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JYGbOWijyFWRJxaIoRd32kLM2iySzUulbp7KNqKGivQ=; b=i3A7UYlU4mj8eOm40vMcwWkrDV
 xmtY02fzvfXFpBVYA2swwoaqALPpJ06L2LvfBE9w16GgalW1zqr27OmjVN24sPfPb+M09HsfE5kkd
 NxsUDtgj9TjXmhKSRvc2bZJiF8PaTQM+72WxWa+Xm+JbwnPna6bkjlFdTfw6SDuiQ4DY=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uT4qP-0007hx-0c for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jun 2025 20:29:45 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7985C41AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1750536803; bh=JYGbOWijyFWRJxaIoRd32kLM2iySzUulbp7KNqKGivQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=C41qFVps6fdrD/DQ7wxtFNzsFwHbI7pL0ZrQC9M1TPDQn8Nar6PtBw6SWQbN3d7+O
 8noqSyPM+a1lD18j3NQtulFQQ2IRMpjICJ+52QpoEfqP8I8nib3D8c0q9e6bzRQh9w
 hiWIkDiS6DwPvN9W9KUS1LpzbDBZ9iK2rGAgL+4j/osh+5ixQwMxk8oK8NnRV8O+YT
 DydAUy5+q7vD8wAlGU5PXTN+ZSxum17rT8Pg2CypAwXgX3gcxor4Kq6ZywWBE8buPO
 bFqUC27Vv+NojzzZkS9MsYodfnFEsr9wxUkBrQP5BlbK9F05NtGQWuy3V9OK/8eXE7
 +Z0VcolsdDdVQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 7985C41AD8;
 Sat, 21 Jun 2025 20:13:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yuanye Ma <yuanye.ma20@gmail.com>, jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
In-Reply-To: <20250618225546.104949-1-yuanye.ma20@gmail.com>
References: <20250618225546.104949-1-yuanye.ma20@gmail.com>
Date: Sat, 21 Jun 2025 14:13:22 -0600
Message-ID: <877c14dfa5.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Yuanye Ma <yuanye.ma20@gmail.com> writes: > This patch fixes
    two minor typos in Documentation/filesystems/f2fs.rst: > > - "ramdom" →
    "random" > - "reenable" → "re-enable" > > The changes improve spelling
   and consistency in the documentati [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1uT4qP-0007hx-0c
Subject: Re: [f2fs-dev] [PATCH] docs: f2fs: fix typos in f2fs.rst
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
Cc: Yuanye Ma <yuanye.ma20@gmail.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WXVhbnllIE1hIDx5dWFueWUubWEyMEBnbWFpbC5jb20+IHdyaXRlczoKCj4gVGhpcyBwYXRjaCBm
aXhlcyB0d28gbWlub3IgdHlwb3MgaW4gRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mMmZzLnJz
dDoKPgo+IC0gInJhbWRvbSIg4oaSICJyYW5kb20iCj4gLSAicmVlbmFibGUiIOKGkiAicmUtZW5h
YmxlIgo+Cj4gVGhlIGNoYW5nZXMgaW1wcm92ZSBzcGVsbGluZyBhbmQgY29uc2lzdGVuY3kgaW4g
dGhlIGRvY3VtZW50YXRpb24uCj4KPiBUaGVzZSBpc3N1ZXMgd2VyZSBpZGVudGlmaWVkIHVzaW5n
IHRoZSAnY29kZXNwZWxsJyB0b29sIHdpdGggdGhlCj4gZm9sbG93aW5nIGNvbW1hbmQ6Cj4KPiAg
ICQgZmluZCBEb2N1bWVudGF0aW9uLyAtcGF0aCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucyAt
cHJ1bmUgLW8gXAo+ICAgICAtbmFtZSAnKi5yc3QnIC1wcmludCB8IHhhcmdzIGNvZGVzcGVsbAo+
Cj4gU2lnbmVkLW9mZi1ieTogWXVhbnllIE1hIDx5dWFueWUubWEyMEBnbWFpbC5jb20+Cj4gLS0t
Cj4gIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvZjJmcy5yc3QgfCA0ICsrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5r
cy4KCmpvbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
