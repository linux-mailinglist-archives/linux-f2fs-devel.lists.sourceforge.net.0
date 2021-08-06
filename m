Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF143E2357
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 08:38:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBtUd-0000Qq-Mi; Fri, 06 Aug 2021 06:38:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hare@suse.de>) id 1mBtUc-0000Qc-Cx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 06:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=11F7vf2VJ6T0TivdTVIFesJ86SixA4ATGqbIwq4iPoQ=; b=TRQK77FrdUcqCOVeT5v4UFL3wJ
 9usg0WHEwDRP20Rv8Rl0DHTGd59j9ztx0XSWsY8KXZi24okHMqtGZF0HPq9KY7qeBvowaX3xrEacS
 z41GFiSwvaM5VTuH3iM33oqAOXU7bHgnBeGfMJLk2cM44Xc0yEzrJWFj7FRxBPL3wy4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=11F7vf2VJ6T0TivdTVIFesJ86SixA4ATGqbIwq4iPoQ=; b=ZrdSPIW84Gs99L8Ux3iyh9soVs
 33x14K74Udr8YJIiu8sld/0Xsq1mll6doytNJpJw+iWqnt1LR9RoqUOak1W6DgQTBn/Bi5SGgE2MR
 jEn9TmX3pL3WaOdAlOekdhNYA3t32pNPIkXFFZMmlEdcO6xxVRSA1jPMP4oNaNAgppBA=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mBtUa-00023C-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 06:38:06 +0000
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B7F71FE9C;
 Fri,  6 Aug 2021 06:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628231878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11F7vf2VJ6T0TivdTVIFesJ86SixA4ATGqbIwq4iPoQ=;
 b=eRW7dggE8AwdKRv1CuCXWzifyRM9OFr/UkLBW6lsOZ7T/xWkU9CSD6erVDLKOIFScOWyMd
 QuVWjUUA7jG1NuI7XjIghexwEEVGfPrsylZqzC9HGp4KqXY0ddD+iwcrbdu1ttzaxSEdkZ
 nXbPdab/f155C9hq28E5a4uEboQHbZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628231878;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11F7vf2VJ6T0TivdTVIFesJ86SixA4ATGqbIwq4iPoQ=;
 b=YSX5NX/l5Tmh+4NUXGP6EZXvs4w+Nsq274PA+1KvG5F50BcXieP02pbk2tcE/uyNW6VKA3
 ina7I8ILN5AD1JBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1F13D136D9;
 Fri,  6 Aug 2021 06:37:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id YWiEBsbYDGGQBgAAGKfGzw
 (envelope-from <hare@suse.de>); Fri, 06 Aug 2021 06:37:58 +0000
To: Damien Le Moal <damien.lemoal@wdc.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
References: <20210806051140.301127-1-damien.lemoal@wdc.com>
 <20210806051140.301127-4-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <d0bc418e-ddf7-6038-427a-2e9ad2f4ab87@suse.de>
Date: Fri, 6 Aug 2021 08:37:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806051140.301127-4-damien.lemoal@wdc.com>
Content-Language: en-US
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.6 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mBtUa-00023C-Lu
Subject: Re: [f2fs-dev] [PATCH v2 3/4] block: rename IOPRIO_BE_NR
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOC82LzIxIDc6MTEgQU0sIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IFRoZSBCRlEgc2NoZWR1
bGVyIGFuZCBpb3ByaW9fY2hlY2tfY2FwKCkgYm90aCBhc3N1bWUgdGhhdCB0aGUgUlQKPiBwcmlv
cml0eSBjbGFzcyAoSU9QUklPX0NMQVNTX1JUKSBjYW4gaGF2ZSB1cCB0byA4IGRpZmZlcmVudCBw
cmlvcml0eQo+IGxldmVscy4gVGhpcyBpcyBjb250cm9sbGVkIHVzaW5nIHRoZSBtYWNybyBJT1BS
SU9fQkVfTlIsIHdoaWNoIGlzIGJhZGx5Cj4gbmFtZWQgYXMgdGhlIG51bWJlciBvZiBsZXZlbHMg
YXBwbGllcyB0byB0aGUgUlQgY2xhc3MuCj4gCj4gUmVuYW1lIElPUFJJT19CRV9OUiB0byB0aGUg
Y2xhc3MgaW5kZXBlbmRlbnQgSU9QUklPX05SX0xFVkVMUyB0byBtYWtlCj4gdGhpbmdzIGNsZWFy
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5j
b20+Cj4gLS0tCj4gICBibG9jay9iZnEtaW9zY2hlZC5jICAgICAgICAgfCA4ICsrKystLS0tCj4g
ICBibG9jay9iZnEtaW9zY2hlZC5oICAgICAgICAgfCA0ICsrLS0KPiAgIGJsb2NrL2JmcS13ZjJx
LmMgICAgICAgICAgICB8IDYgKysrLS0tCj4gICBibG9jay9pb3ByaW8uYyAgICAgICAgICAgICAg
fCAzICstLQo+ICAgZnMvZjJmcy9zeXNmcy5jICAgICAgICAgICAgIHwgMiArLQo+ICAgaW5jbHVk
ZS91YXBpL2xpbnV4L2lvcHJpby5oIHwgNCArKy0tCj4gICA2IGZpbGVzIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9ibG9jay9iZnEt
aW9zY2hlZC5jIGIvYmxvY2svYmZxLWlvc2NoZWQuYwo+IGluZGV4IDFmMzhkNzU1MjRhZS4uZDU4
MjRjYWIzNGQ3IDEwMDY0NAo+IC0tLSBhL2Jsb2NrL2JmcS1pb3NjaGVkLmMKPiArKysgYi9ibG9j
ay9iZnEtaW9zY2hlZC5jCj4gQEAgLTI1MDUsNyArMjUwNSw3IEBAIHZvaWQgYmZxX2VuZF93cl9h
c3luY19xdWV1ZXMoc3RydWN0IGJmcV9kYXRhICpiZnFkLAo+ICAgCWludCBpLCBqOwo+ICAgCj4g
ICAJZm9yIChpID0gMDsgaSA8IDI7IGkrKykKPiAtCQlmb3IgKGogPSAwOyBqIDwgSU9QUklPX0JF
X05SOyBqKyspCj4gKwkJZm9yIChqID0gMDsgaiA8IElPUFJJT19OUl9MRVZFTFM7IGorKykKPiAg
IAkJCWlmIChiZnFnLT5hc3luY19iZnFxW2ldW2pdKQo+ICAgCQkJCWJmcV9iZnFxX2VuZF93cihi
ZnFnLT5hc3luY19iZnFxW2ldW2pdKTsKPiAgIAlpZiAoYmZxZy0+YXN5bmNfaWRsZV9iZnFxKQo+
IEBAIC01MjkwLDEwICs1MjkwLDEwIEBAIGJmcV9zZXRfbmV4dF9pb3ByaW9fZGF0YShzdHJ1Y3Qg
YmZxX3F1ZXVlICpiZnFxLCBzdHJ1Y3QgYmZxX2lvX2NxICpiaWMpCj4gICAJCWJyZWFrOwo+ICAg
CX0KPiAgIAo+IC0JaWYgKGJmcXEtPm5ld19pb3ByaW8gPj0gSU9QUklPX0JFX05SKSB7Cj4gKwlp
ZiAoYmZxcS0+bmV3X2lvcHJpbyA+PSBJT1BSSU9fTlJfTEVWRUxTKSB7Cj4gICAJCXByX2NyaXQo
ImJmcV9zZXRfbmV4dF9pb3ByaW9fZGF0YTogbmV3X2lvcHJpbyAlZFxuIiwKPiAgIAkJCWJmcXEt
Pm5ld19pb3ByaW8pOwo+IC0JCWJmcXEtPm5ld19pb3ByaW8gPSBJT1BSSU9fQkVfTlIgLSAxOwo+
ICsJCWJmcXEtPm5ld19pb3ByaW8gPSBJT1BSSU9fTlJfTEVWRUxTIC0gMTsKPiAgIAl9Cj4gICAK
PiAgIAliZnFxLT5lbnRpdHkubmV3X3dlaWdodCA9IGJmcV9pb3ByaW9fdG9fd2VpZ2h0KGJmcXEt
Pm5ld19pb3ByaW8pOwo+IEBAIC02ODIyLDcgKzY4MjIsNyBAQCB2b2lkIGJmcV9wdXRfYXN5bmNf
cXVldWVzKHN0cnVjdCBiZnFfZGF0YSAqYmZxZCwgc3RydWN0IGJmcV9ncm91cCAqYmZxZykKPiAg
IAlpbnQgaSwgajsKPiAgIAo+ICAgCWZvciAoaSA9IDA7IGkgPCAyOyBpKyspCj4gLQkJZm9yIChq
ID0gMDsgaiA8IElPUFJJT19CRV9OUjsgaisrKQo+ICsJCWZvciAoaiA9IDA7IGogPCBJT1BSSU9f
TlJfTEVWRUxTOyBqKyspCj4gICAJCQlfX2JmcV9wdXRfYXN5bmNfYmZxcShiZnFkLCAmYmZxZy0+
YXN5bmNfYmZxcVtpXVtqXSk7Cj4gICAKPiAgIAlfX2JmcV9wdXRfYXN5bmNfYmZxcShiZnFkLCAm
YmZxZy0+YXN5bmNfaWRsZV9iZnFxKTsKPiBkaWZmIC0tZ2l0IGEvYmxvY2svYmZxLWlvc2NoZWQu
aCBiL2Jsb2NrL2JmcS1pb3NjaGVkLmgKPiBpbmRleCA5OWMyYTNjYjA4MWUuLjM4NWUyOGE4NDNk
MSAxMDA2NDQKPiAtLS0gYS9ibG9jay9iZnEtaW9zY2hlZC5oCj4gKysrIGIvYmxvY2svYmZxLWlv
c2NoZWQuaAo+IEBAIC05MzEsNyArOTMxLDcgQEAgc3RydWN0IGJmcV9ncm91cCB7Cj4gICAKPiAg
IAl2b2lkICpiZnFkOwo+ICAgCj4gLQlzdHJ1Y3QgYmZxX3F1ZXVlICphc3luY19iZnFxWzJdW0lP
UFJJT19CRV9OUl07Cj4gKwlzdHJ1Y3QgYmZxX3F1ZXVlICphc3luY19iZnFxWzJdW0lPUFJJT19O
Ul9MRVZFTFNdOwo+ICAgCXN0cnVjdCBiZnFfcXVldWUgKmFzeW5jX2lkbGVfYmZxcTsKPiAgIAo+
ICAgCXN0cnVjdCBiZnFfZW50aXR5ICpteV9lbnRpdHk7Cj4gQEAgLTk0OCw3ICs5NDgsNyBAQCBz
dHJ1Y3QgYmZxX2dyb3VwIHsKPiAgIAlzdHJ1Y3QgYmZxX2VudGl0eSBlbnRpdHk7Cj4gICAJc3Ry
dWN0IGJmcV9zY2hlZF9kYXRhIHNjaGVkX2RhdGE7Cj4gICAKPiAtCXN0cnVjdCBiZnFfcXVldWUg
KmFzeW5jX2JmcXFbMl1bSU9QUklPX0JFX05SXTsKPiArCXN0cnVjdCBiZnFfcXVldWUgKmFzeW5j
X2JmcXFbMl1bSU9QUklPX05SX0xFVkVMU107Cj4gICAJc3RydWN0IGJmcV9xdWV1ZSAqYXN5bmNf
aWRsZV9iZnFxOwo+ICAgCj4gICAJc3RydWN0IHJiX3Jvb3QgcnFfcG9zX3RyZWU7Cj4gZGlmZiAt
LWdpdCBhL2Jsb2NrL2JmcS13ZjJxLmMgYi9ibG9jay9iZnEtd2YycS5jCj4gaW5kZXggN2E0NjJk
ZjcxZjY4Li5iNzRjYzBkYTExOGUgMTAwNjQ0Cj4gLS0tIGEvYmxvY2svYmZxLXdmMnEuYwo+ICsr
KyBiL2Jsb2NrL2JmcS13ZjJxLmMKPiBAQCAtNTA1LDcgKzUwNSw3IEBAIHN0YXRpYyB2b2lkIGJm
cV9hY3RpdmVfaW5zZXJ0KHN0cnVjdCBiZnFfc2VydmljZV90cmVlICpzdCwKPiAgICAqLwo+ICAg
dW5zaWduZWQgc2hvcnQgYmZxX2lvcHJpb190b193ZWlnaHQoaW50IGlvcHJpbykKPiAgIHsKPiAt
CXJldHVybiAoSU9QUklPX0JFX05SIC0gaW9wcmlvKSAqIEJGUV9XRUlHSFRfQ09OVkVSU0lPTl9D
T0VGRjsKPiArCXJldHVybiAoSU9QUklPX05SX0xFVkVMUyAtIGlvcHJpbykgKiBCRlFfV0VJR0hU
X0NPTlZFUlNJT05fQ09FRkY7Cj4gICB9Cj4gICAKPiAgIC8qKgo+IEBAIC01MTQsMTIgKzUxNCwx
MiBAQCB1bnNpZ25lZCBzaG9ydCBiZnFfaW9wcmlvX3RvX3dlaWdodChpbnQgaW9wcmlvKQo+ICAg
ICoKPiAgICAqIFRvIHByZXNlcnZlIGFzIG11Y2ggYXMgcG9zc2libGUgdGhlIG9sZCBvbmx5LWlv
cHJpbyB1c2VyIGludGVyZmFjZSwKPiAgICAqIDAgaXMgdXNlZCBhcyBhbiBlc2NhcGUgaW9wcmlv
IHZhbHVlIGZvciB3ZWlnaHRzIChudW1lcmljYWxseSkgZXF1YWwgb3IKPiAtICogbGFyZ2VyIHRo
YW4gSU9QUklPX0JFX05SICogQkZRX1dFSUdIVF9DT05WRVJTSU9OX0NPRUZGLgo+ICsgKiBsYXJn
ZXIgdGhhbiBJT1BSSU9fTlJfTEVWRUxTICogQkZRX1dFSUdIVF9DT05WRVJTSU9OX0NPRUZGLgo+
ICAgICovCj4gICBzdGF0aWMgdW5zaWduZWQgc2hvcnQgYmZxX3dlaWdodF90b19pb3ByaW8oaW50
IHdlaWdodCkKPiAgIHsKPiAgIAlyZXR1cm4gbWF4X3QoaW50LCAwLAo+IC0JCSAgICAgSU9QUklP
X0JFX05SICogQkZRX1dFSUdIVF9DT05WRVJTSU9OX0NPRUZGIC0gd2VpZ2h0KTsKPiArCQkgICAg
IElPUFJJT19OUl9MRVZFTFMgKiBCRlFfV0VJR0hUX0NPTlZFUlNJT05fQ09FRkYgLSB3ZWlnaHQp
Owo+ICAgfQo+ICAgCj4gICBzdGF0aWMgdm9pZCBiZnFfZ2V0X2VudGl0eShzdHJ1Y3QgYmZxX2Vu
dGl0eSAqZW50aXR5KQo+IGRpZmYgLS1naXQgYS9ibG9jay9pb3ByaW8uYyBiL2Jsb2NrL2lvcHJp
by5jCj4gaW5kZXggYmVlNjI4ZjlmMWIyLi5jYTZiMTM2YzU1ODYgMTAwNjQ0Cj4gLS0tIGEvYmxv
Y2svaW9wcmlvLmMKPiArKysgYi9ibG9jay9pb3ByaW8uYwo+IEBAIC03NCw5ICs3NCw4IEBAIGlu
dCBpb3ByaW9fY2hlY2tfY2FwKGludCBpb3ByaW8pCj4gICAJCQlmYWxsdGhyb3VnaDsKPiAgIAkJ
CS8qIHJ0IGhhcyBwcmlvIGZpZWxkIHRvbyAqLwo+ICAgCQljYXNlIElPUFJJT19DTEFTU19CRToK
PiAtCQkJaWYgKGRhdGEgPj0gSU9QUklPX0JFX05SIHx8IGRhdGEgPCAwKQo+ICsJCQlpZiAoZGF0
YSA+PSBJT1BSSU9fTlJfTEVWRUxTIHx8IGRhdGEgPCAwKQo+ICAgCQkJCXJldHVybiAtRUlOVkFM
Owo+IC0KPiAgIAkJCWJyZWFrOwo+ICAgCQljYXNlIElPUFJJT19DTEFTU19JRExFOgo+ICAgCQkJ
YnJlYWs7Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3lzZnMuYyBiL2ZzL2YyZnMvc3lzZnMuYwo+
IGluZGV4IDY2NDIyNDYyMDZiZC4uZGFhZDUzMmE0ZTJiIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMv
c3lzZnMuYwo+ICsrKyBiL2ZzL2YyZnMvc3lzZnMuYwo+IEBAIC0zNzgsNyArMzc4LDcgQEAgc3Rh
dGljIHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0IGYyZnNfYXR0ciAqYSwKPiAgIAkJcmV0ID0g
a3N0cnRvbChuYW1lLCAxMCwgJmRhdGEpOwo+ICAgCQlpZiAocmV0KQo+ICAgCQkJcmV0dXJuIHJl
dDsKPiAtCQlpZiAoZGF0YSA+PSBJT1BSSU9fQkVfTlIgfHwgZGF0YSA8IDApCj4gKwkJaWYgKGRh
dGEgPj0gSU9QUklPX05SX0xFVkVMUyB8fCBkYXRhIDwgMCkKPiAgIAkJCXJldHVybiAtRUlOVkFM
Owo+ICAgCj4gICAJCWNwcmMtPmNrcHRfdGhyZWFkX2lvcHJpbyA9IElPUFJJT19QUklPX1ZBTFVF
KGNsYXNzLCBkYXRhKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2lvcHJpby5o
IGIvaW5jbHVkZS91YXBpL2xpbnV4L2lvcHJpby5oCj4gaW5kZXggYWJjNDA5NjVhYTk2Li5iOWQ0
ODc0NGRhY2IgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2lvcHJpby5oCj4gKysr
IGIvaW5jbHVkZS91YXBpL2xpbnV4L2lvcHJpby5oCj4gQEAgLTMxLDkgKzMxLDkgQEAgZW51bSB7
Cj4gICB9Owo+ICAgCj4gICAvKgo+IC0gKiA4IGJlc3QgZWZmb3J0IHByaW9yaXR5IGxldmVscyBh
cmUgc3VwcG9ydGVkCj4gKyAqIFRoZSBSVCBhbiBCRSBwcmlvcml0eSBjbGFzc2VzIHN1cHBvcnQg
dXAgdG8gOCBwcmlvcml0eSBsZXZlbHMuCgpUaGlzIHNlbnRlbmNlIG5vIHZlcmIgOi0pCihtYXli
ZSAnVGhlIFJUIGNsYXNzIGlzIGFuIEJFIHByaW9yaXR5IC4uLic/KQoKQ2hlZXJzLAoKSGFubmVz
Ci0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9yYWdlIEFy
Y2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTEx
IDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJl
cjogRmVsaXggSW1lbmTDtnJmZmVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
