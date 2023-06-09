Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7A072902D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Jun 2023 08:41:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7VoE-0003nL-9k;
	Fri, 09 Jun 2023 06:41:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hare@suse.de>) id 1q7VoD-0003nF-B9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jun 2023 06:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fwirhtabGvCDuiR1jxZAiR7OdtCbwijcduPp+mqjcaE=; b=BWP1HTB+3DAUKdxm8/PKYEVzBD
 Lhhx8hjd7vNaEKwtpBDnEVk2xWpeliVWHpBufRbeM1Rc8TbTPQXCPnWjrod/AkmOggP9L+YLAJARp
 Z9CzDsExtLi5Sj69K77zk716HX2J0DpbDwUQQYxHPuK0st8ZsoMs9S5CiZDNl7T5AUVg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fwirhtabGvCDuiR1jxZAiR7OdtCbwijcduPp+mqjcaE=; b=Ut0IYtSjLgBKxddh6xju5YaybP
 2Am+bjknAMJbecvy3VmFvkWRVf2OIfiozNIQh/bw7AVUQVGBOWyfMNNHy3MjHB7M2Be6lFkTkQ0Ud
 WUd6oxib4+sA5owDOmNSfReNmrlJh7JwhWb32fSmWwy0YzfKbTu89YHQGAjqAAtIQKbc=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q7VoD-0002sx-3M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jun 2023 06:41:18 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 87DF021A01;
 Fri,  9 Jun 2023 06:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686292861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwirhtabGvCDuiR1jxZAiR7OdtCbwijcduPp+mqjcaE=;
 b=ehZ0672Jmg/d0MyG6AB71GZgF+CyZ7aCz0fEPEWeIM2+pQ9Yx7bDj7sHuPrhdKIDHah+B4
 x1845pdOYRa2De2VoQdmA0KAKObSWeKv9fEnhF1iOao6dTuYXRa5ZfsQfydIP8CefTEFZO
 h1zXrLjKHTLXFAO3wTXo8ujyMLb7Ym8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686292861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwirhtabGvCDuiR1jxZAiR7OdtCbwijcduPp+mqjcaE=;
 b=tO7zUW+BGSFLyYxsGBGSKkQs6Pyd8vG0aztlZWiq/wA+rE6rLQYQ4enb0147Vn3wZhl3U9
 epRQIH1KZsrj8BAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69262139C8;
 Fri,  9 Jun 2023 06:41:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mrFJGHzJgmR1OAAAMHmgww
 (envelope-from <hare@suse.de>); Fri, 09 Jun 2023 06:41:00 +0000
Message-ID: <61eab396-8424-ba7c-3ea1-7973330e0c57@suse.de>
Date: Fri, 9 Jun 2023 08:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20230608110258.189493-1-hch@lst.de>
 <20230608110258.189493-28-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230608110258.189493-28-hch@lst.de>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/8/23 13:02, Christoph Hellwig wrote: > The only overlap
 between the block open flags mapped into the fmode_t and > other uses of
 fmode_t are FMODE_READ and FMODE_WRITE. Define a new > blk_mode_t [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q7VoD-0002sx-3M
Subject: Re: [f2fs-dev] [dm-devel] [PATCH 27/30] block: replace fmode_t with
 a block-specific type for block open flags
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNi84LzIzIDEzOjAyLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBUaGUgb25seSBvdmVy
bGFwIGJldHdlZW4gdGhlIGJsb2NrIG9wZW4gZmxhZ3MgbWFwcGVkIGludG8gdGhlIGZtb2RlX3Qg
YW5kCj4gb3RoZXIgdXNlcyBvZiBmbW9kZV90IGFyZSBGTU9ERV9SRUFEIGFuZCBGTU9ERV9XUklU
RS4gIERlZmluZSBhIG5ldwo+IGJsa19tb2RlX3QgaW5zdGVhZCBmb3IgdXNlIGluIGJsa2Rldl9n
ZXRfYnlfe2RldixwYXRofSwgLT5vcGVuIGFuZAo+IC0+aW9jdGwgYW5kIHN0b3AgYWJ1c2luZyBm
bW9kZV90Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
Pgo+IEFja2VkLWJ5OiBKYWNrIFdhbmcgPGppbnB1LndhbmdAaW9ub3MuY29tPgkJW3JuYmRdCj4g
LS0tCj4gICBhcmNoL3VtL2RyaXZlcnMvdWJkX2tlcm4uYyAgICAgICAgICB8ICA4ICsrKy0tLQo+
ICAgYXJjaC94dGVuc2EvcGxhdGZvcm1zL2lzcy9zaW1kaXNrLmMgfCAgMiArLQo+ICAgYmxvY2sv
YmRldi5jICAgICAgICAgICAgICAgICAgICAgICAgfCAzMiArKysrKysrKysrKy0tLS0tLS0tLS0t
Cj4gICBibG9jay9ibGstem9uZWQuYyAgICAgICAgICAgICAgICAgICB8ICA4ICsrKy0tLQo+ICAg
YmxvY2svYmxrLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAxMSArKysrLS0tLQo+ICAgYmxv
Y2svZm9wcy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAzMiArKysrKysrKysrKysrKysrKy0t
LS0tCj4gICBibG9jay9nZW5oZC5jICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKy0tLQo+
ICAgYmxvY2svaW9jdGwuYyAgICAgICAgICAgICAgICAgICAgICAgfCA0MiArKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICAgZHJpdmVycy9ibG9jay9hbWlmbG9wLmMgICAgICAgICAgICAg
fCAxMiArKysrLS0tLS0KPiAgIGRyaXZlcnMvYmxvY2svYW9lL2FvZWJsay5jICAgICAgICAgIHwg
IDQgKy0tCj4gICBkcml2ZXJzL2Jsb2NrL2F0YWZsb3AuYyAgICAgICAgICAgICB8IDI1ICsrKysr
KysrKy0tLS0tLS0tCj4gICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgICAgICB8ICA3
ICsrLS0tCj4gICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jICAgICAgICB8ICAyICstCj4g
ICBkcml2ZXJzL2Jsb2NrL2Zsb3BweS5jICAgICAgICAgICAgICB8IDI4ICsrKysrKysrKy0tLS0t
LS0tLS0KPiAgIGRyaXZlcnMvYmxvY2svbG9vcC5jICAgICAgICAgICAgICAgIHwgMjIgKysrKysr
Ky0tLS0tLS0tCj4gICBkcml2ZXJzL2Jsb2NrL210aXAzMnh4L210aXAzMnh4LmMgICB8ICA0ICst
LQo+ICAgZHJpdmVycy9ibG9jay9uYmQuYyAgICAgICAgICAgICAgICAgfCAgNCArLS0KPiAgIGRy
aXZlcnMvYmxvY2svcGt0Y2R2ZC5jICAgICAgICAgICAgIHwgMTcgKysrKysrLS0tLS0tCj4gICBk
cml2ZXJzL2Jsb2NrL3JiZC5jICAgICAgICAgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL2Js
b2NrL3JuYmQvcm5iZC1jbHQuYyAgICAgICB8ICA0ICstLQo+ICAgZHJpdmVycy9ibG9jay9ybmJk
L3JuYmQtc3J2LmMgICAgICAgfCAgNCArLS0KPiAgIGRyaXZlcnMvYmxvY2svc3VudmRjLmMgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvYmxvY2svc3dpbS5jICAgICAgICAgICAgICAg
IHwgMTYgKysrKystLS0tLS0KPiAgIGRyaXZlcnMvYmxvY2svc3dpbTMuYyAgICAgICAgICAgICAg
IHwgMjQgKysrKysrKystLS0tLS0tLS0KPiAgIGRyaXZlcnMvYmxvY2svdWJsa19kcnYuYyAgICAg
ICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgIHwg
IDIgKy0KPiAgIGRyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMgICAgICAgIHwgIDIgKy0KPiAg
IGRyaXZlcnMvYmxvY2svejJyYW0uYyAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMv
YmxvY2svenJhbS96cmFtX2Rydi5jICAgICAgIHwgIDYgKystLS0KPiAgIGRyaXZlcnMvY2Ryb20v
Y2Ryb20uYyAgICAgICAgICAgICAgIHwgIDYgKystLS0KPiAgIGRyaXZlcnMvY2Ryb20vZ2Ryb20u
YyAgICAgICAgICAgICAgIHwgIDQgKy0tCj4gICBkcml2ZXJzL21kL2JjYWNoZS9iY2FjaGUuaCAg
ICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL21kL2JjYWNoZS9yZXF1ZXN0LmMgICAgICAgICB8
ICA0ICstLQo+ICAgZHJpdmVycy9tZC9iY2FjaGUvc3VwZXIuYyAgICAgICAgICAgfCAgNiArKy0t
LQo+ICAgZHJpdmVycy9tZC9kbS1jYWNoZS10YXJnZXQuYyAgICAgICAgfCAxMiArKysrLS0tLS0K
PiAgIGRyaXZlcnMvbWQvZG0tY2xvbmUtdGFyZ2V0LmMgICAgICAgIHwgMTAgKysrLS0tLQo+ICAg
ZHJpdmVycy9tZC9kbS1jb3JlLmggICAgICAgICAgICAgICAgfCAgNyArKystLQo+ICAgZHJpdmVy
cy9tZC9kbS1lcmEtdGFyZ2V0LmMgICAgICAgICAgfCAgNiArKystLQo+ICAgZHJpdmVycy9tZC9k
bS1pb2N0bC5jICAgICAgICAgICAgICAgfCAxMCArKystLS0tCj4gICBkcml2ZXJzL21kL2RtLXNu
YXAuYyAgICAgICAgICAgICAgICB8ICA0ICstLQo+ICAgZHJpdmVycy9tZC9kbS10YWJsZS5jICAg
ICAgICAgICAgICAgfCAxMSArKysrLS0tLQo+ICAgZHJpdmVycy9tZC9kbS10aGluLmMgICAgICAg
ICAgICAgICAgfCAgOSArKysrLS0tCj4gICBkcml2ZXJzL21kL2RtLXZlcml0eS1mZWMuYyAgICAg
ICAgICB8ICAyICstCj4gICBkcml2ZXJzL21kL2RtLXZlcml0eS10YXJnZXQuYyAgICAgICB8ICA2
ICsrLS0tCj4gICBkcml2ZXJzL21kL2RtLmMgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKy0t
LS0KPiAgIGRyaXZlcnMvbWQvZG0uaCAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGRy
aXZlcnMvbWQvbWQuYyAgICAgICAgICAgICAgICAgICAgIHwgIDggKysrLS0tCj4gICBkcml2ZXJz
L21tYy9jb3JlL2Jsb2NrLmMgICAgICAgICAgICB8ICA4ICsrKy0tLQo+ICAgZHJpdmVycy9tdGQv
ZGV2aWNlcy9ibG9jazJtdGQuYyAgICAgfCAgNCArLS0KPiAgIGRyaXZlcnMvbXRkL210ZF9ibGtk
ZXZzLmMgICAgICAgICAgIHwgIDQgKy0tCj4gICBkcml2ZXJzL210ZC91YmkvYmxvY2suYyAgICAg
ICAgICAgICB8ICA1ICsrLS0KPiAgIGRyaXZlcnMvbnZtZS9ob3N0L2NvcmUuYyAgICAgICAgICAg
IHwgIDIgKy0KPiAgIGRyaXZlcnMvbnZtZS9ob3N0L2lvY3RsLmMgICAgICAgICAgIHwgIDggKysr
LS0tCj4gICBkcml2ZXJzL252bWUvaG9zdC9tdWx0aXBhdGguYyAgICAgICB8ICAyICstCj4gICBk
cml2ZXJzL252bWUvaG9zdC9udm1lLmggICAgICAgICAgICB8ICA0ICstLQo+ICAgZHJpdmVycy9u
dm1lL3RhcmdldC9pby1jbWQtYmRldi5jICAgfCAgMiArLQo+ICAgZHJpdmVycy9zMzkwL2Jsb2Nr
L2Rhc2QuYyAgICAgICAgICAgfCAgNiArKy0tLQo+ICAgZHJpdmVycy9zMzkwL2Jsb2NrL2Rhc2Rf
Z2VuaGQuYyAgICAgfCAgMyArKy0KPiAgIGRyaXZlcnMvczM5MC9ibG9jay9kYXNkX2ludC5oICAg
ICAgIHwgIDMgKystCj4gICBkcml2ZXJzL3MzOTAvYmxvY2svZGFzZF9pb2N0bC5jICAgICB8ICAy
ICstCj4gICBkcml2ZXJzL3MzOTAvYmxvY2svZGNzc2Jsay5jICAgICAgICB8ICA0ICstLQo+ICAg
ZHJpdmVycy9zY3NpL3NkLmMgICAgICAgICAgICAgICAgICAgfCAxOSArKysrKystLS0tLS0tCj4g
ICBkcml2ZXJzL3Njc2kvc3IuYyAgICAgICAgICAgICAgICAgICB8IDEwICsrKy0tLS0KPiAgIGRy
aXZlcnMvdGFyZ2V0L3RhcmdldF9jb3JlX2libG9jay5jIHwgIDUgKystLQo+ICAgZHJpdmVycy90
YXJnZXQvdGFyZ2V0X2NvcmVfcHNjc2kuYyAgfCAgNCArLS0KPiAgIGZzL2J0cmZzL2Rldi1yZXBs
YWNlLmMgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIGZzL2J0cmZzL3N1cGVyLmMgICAgICAgICAg
ICAgICAgICAgIHwgIDggKysrLS0tCj4gICBmcy9idHJmcy92b2x1bWVzLmMgICAgICAgICAgICAg
ICAgICB8IDE2ICsrKysrLS0tLS0tCj4gICBmcy9idHJmcy92b2x1bWVzLmggICAgICAgICAgICAg
ICAgICB8ICA0ICstLQo+ICAgZnMvZXJvZnMvc3VwZXIuYyAgICAgICAgICAgICAgICAgICAgfCAg
MiArLQo+ICAgZnMvZXh0NC9zdXBlci5jICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAg
ZnMvZjJmcy9zdXBlci5jICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgZnMvamZzL2pm
c19sb2dtZ3IuYyAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgZnMvbmZzL2Jsb2NrbGF5b3V0
L2Rldi5jICAgICAgICAgICAgfCAgNSArKy0tCj4gICBmcy9vY2ZzMi9jbHVzdGVyL2hlYXJ0YmVh
dC5jICAgICAgICB8ICAzICsrLQo+ICAgZnMvcmVpc2VyZnMvam91cm5hbC5jICAgICAgICAgICAg
ICAgfCAgNCArLS0KPiAgIGZzL3hmcy94ZnNfc3VwZXIuYyAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgIGluY2x1ZGUvbGludXgvYmxrZGV2LmggICAgICAgICAgICAgIHwgMzAgKysrKysrKysr
KysrKysrKy0tLS0tCj4gICBpbmNsdWRlL2xpbnV4L2Nkcm9tLmggICAgICAgICAgICAgICB8ICAz
ICsrLQo+ICAgaW5jbHVkZS9saW51eC9kZXZpY2UtbWFwcGVyLmggICAgICAgfCAgOCArKystLS0K
PiAgIGtlcm5lbC9wb3dlci9zd2FwLmMgICAgICAgICAgICAgICAgIHwgIDYgKystLS0KPiAgIG1t
L3N3YXBmaWxlLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIDgyIGZpbGVzIGNo
YW5nZWQsIDMzNCBpbnNlcnRpb25zKCspLCAzMTUgZGVsZXRpb25zKC0pCj4gClJldmlld2VkLWJ5
OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIu
IEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QK
aGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2
ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3RldiwgQW5kcmV3Ck15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIE1hcnRqZSBCb3VkaWVuIE1vZXJt
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
