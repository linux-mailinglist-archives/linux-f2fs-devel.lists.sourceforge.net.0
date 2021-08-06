Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0A3E235D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 08:39:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBtWA-0004pc-7g; Fri, 06 Aug 2021 06:39:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hare@suse.de>) id 1mBtW9-0004pW-FA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 06:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cV0RA/Arj9e5UZlBlatsxjaXnCgVHR/k0A0IbcKoE5s=; b=ICWhv4znvtOQZB3n99lNSxud5g
 Id/KdxU/EwQqwyak2S+kjKo5A5B/8CSVd/rEYNjaU0VU5kV4vmYBBO+rC8Hc3ZpU595Vllf5aJuTf
 1BB9hDhbEy3vZxoRj6p+wp7CEf5wJQDYP0S0DDM0nwjXOU08/cchWvSfxNNbGp/KKAg0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cV0RA/Arj9e5UZlBlatsxjaXnCgVHR/k0A0IbcKoE5s=; b=ZguWCddTQ8sNQgYXT3qpkwcExs
 Ayst67iZlpRIqTeQxbG5Gx0B3esUdkIddQWcgytqhR8Kp4nDDwf9kyrGwnpZP89kdeIg6HaWST6VR
 gQFtzt0rW4qRsaRWmInoX43KCIymm0ltcIB7ez+lj7h7Cob9pL67Pgfrj+Agqne2Y0Cs=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mBtW3-00EKWI-2L
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 06:39:41 +0000
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D7154220DC;
 Fri,  6 Aug 2021 06:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628231968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cV0RA/Arj9e5UZlBlatsxjaXnCgVHR/k0A0IbcKoE5s=;
 b=vQulwVbMfvbzZndkQLuSEyPzMd0nJJZxpwQsVnUE+RlZbTGhHPQZUu4RlSjtQfxIRTX87s
 QOJG1ZahM9FxFjE9bksgm5zeXG4yIiN99epOxMPVjXlobcJogh4bD9tFeKx1CPPZcUx5EW
 NAcSlzdC1LnkEtfaU6dj6Qi2AAGOXIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628231968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cV0RA/Arj9e5UZlBlatsxjaXnCgVHR/k0A0IbcKoE5s=;
 b=iqaMnbGiXV+xcE3ghgfFmGGZirrBiKqfN+VYhLeMN0spHkOQzmqSFyoZK+7JxqWx80CvfB
 Gaw3lLi1NleSWaDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8B8DA136D9;
 Fri,  6 Aug 2021 06:39:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id UKj+ICDZDGHTBgAAGKfGzw
 (envelope-from <hare@suse.de>); Fri, 06 Aug 2021 06:39:28 +0000
To: Damien Le Moal <damien.lemoal@wdc.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
References: <20210806051140.301127-1-damien.lemoal@wdc.com>
 <20210806051140.301127-5-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <8304adbf-f7de-b8ae-3230-f19c8e51cace@suse.de>
Date: Fri, 6 Aug 2021 08:39:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806051140.301127-5-damien.lemoal@wdc.com>
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
X-Headers-End: 1mBtW3-00EKWI-2L
Subject: Re: [f2fs-dev] [PATCH v2 4/4] block: fix default IO priority
 handling
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

T24gOC82LzIxIDc6MTEgQU0sIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IFRoZSBkZWZhdWx0IElP
IHByaW9yaXR5IGlzIHRoZSBiZXN0IGVmZm9ydCAoQkUpIGNsYXNzIHdpdGggdGhlCj4gbm9ybWFs
IHByaW9yaXR5IGxldmVsIElPUFJJT19OT1JNICg0KS4gSG93ZXZlciwgZ2V0X3Rhc2tfaW9wcmlv
KCkKPiByZXR1cm5zIElPUFJJT19DTEFTU19OT05FL0lPUFJJT19OT1JNIGFzIHRoZSBkZWZhdWx0
IHByaW9yaXR5IGFuZAo+IGdldF9jdXJyZW50X2lvcHJpbygpIHJldHVybnMgSU9QUklPX0NMQVNT
X05PTkUvMC4gTGV0J3MgYmUgY29uc2lzdGVudAo+IHdpdGggdGhlIGRlZmluZWQgZGVmYXVsdCBh
bmQgaGF2ZSBib3RoIG9mIHRoZXNlIGZ1bmN0aW9ucyByZXR1cm4gdGhlCj4gZGVmYXVsdCBwcmlv
cml0eSBJT1BSSU9fUFJJT19WQUxVRShJT1BSSU9fQ0xBU1NfQkUsIElPUFJJT19OT1JNKSB3aGVu
Cj4gdGhlIHVzZXIgZGlkIG5vdCBkZWZpbmUgYW5vdGhlciBkZWZhdWx0IElPIHByaW9yaXR5IGZv
ciB0aGUgdGFzay4KPiAKPiBJbiBpbmNsdWRlL2xpbnV4L2lvcHJpby5oLCByZW5hbWUgdGhlIElP
UFJJT19OT1JNIG1hY3JvIHRvCj4gSU9QUklPX0JFX05PUk0gdG8gY2xhcmlmeSB0aGF0IHRoaXMg
ZGVmYXVsdCBsZXZlbCBhcHBsaWVzIHRvIHRoZSBCRQo+IHByaW90aXR5IGNsYXNzLiBBbHNvLCBk
ZWZpbmUgdGhlIG1hY3JvIElPUFJJT19ERUZBVUxUIGFzCj4gSU9QUklPX1BSSU9fVkFMVUUoSU9Q
UklPX0NMQVNTX0JFLCBJT1BSSU9fQkVfTk9STSkgYW5kIHVzZSB0aGlzIG5ldwo+IG1hY3JvIHdo
ZW4gc2V0dGluZyBhIHByaW9yaXR5IHRvIHRoZSBkZWZhdWx0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+Cj4gLS0tCj4gICBibG9jay9i
ZnEtaW9zY2hlZC5jICAgICAgICAgIHwgMiArLQo+ICAgYmxvY2svaW9wcmlvLmMgICAgICAgICAg
ICAgICB8IDYgKysrLS0tCj4gICBkcml2ZXJzL252bWUvaG9zdC9saWdodG52bS5jIHwgMiArLQo+
ICAgaW5jbHVkZS9saW51eC9pb3ByaW8uaCAgICAgICB8IDcgKysrKysrLQo+ICAgaW5jbHVkZS91
YXBpL2xpbnV4L2lvcHJpby5oICB8IDQgKystLQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tl
IDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2Ug
ICAgICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkg
KEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
