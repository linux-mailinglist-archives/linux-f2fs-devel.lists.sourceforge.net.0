Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5FD3E29D4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 13:38:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mByBd-0006ur-Ke; Fri, 06 Aug 2021 11:38:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <hare@suse.de>) id 1mByBa-0006ud-72
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 11:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=74p1E+p8LcsCmT89H6VwKBRuLoJxSHC8dZgtgLIZbHg=; b=CWnknE97cktCk276zeKcaV78Cu
 mPJCdzq9Dp9fbwwtvwk/Dkd6SAm9T7ZUE3cKJvSFy1++oDZBW0bNQMPjy8ZyPs9fsCSQAGQJ0Fv71
 wBUd8rwNcAsFWjcww55T0+4yw8wTwX8EysDAbi/oyqqM4dtbNw2kl72YRJFEQ8mUwXBU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=74p1E+p8LcsCmT89H6VwKBRuLoJxSHC8dZgtgLIZbHg=; b=P8CxqWhHr4/a3LvFdss0pNfaSK
 wcrgOQQ39F0pbWczMA7ptpGSU6xH975HxzsAX+RZPo8VXiZrccXZwF4mcPFM/T+fmFz6lQamiE1J0
 dyRAyCcYMO5ZYIJ47FrdcshplZHssiapu+nc2+QpVTgle3554Q+cNnYDcxFEs980BTCs=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mByBW-00EeXI-JS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 11:38:46 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 63CE52240C;
 Fri,  6 Aug 2021 11:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628249916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=74p1E+p8LcsCmT89H6VwKBRuLoJxSHC8dZgtgLIZbHg=;
 b=gx/TIw5bC7BWyYdCvaWI8oJzJgZOy6wYOIyQlhiqFtgg7scvgbkAjN43IZR84h6lozb2vf
 v22910D1csvcSVsWzcDq1CclpZP1CuvZtq9VoFFwE5xdoKtsNSkMOdGqKRfpzk2app4bSW
 I4um1IESkgVb5q0qKM3+t1mqmMXoP8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628249916;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=74p1E+p8LcsCmT89H6VwKBRuLoJxSHC8dZgtgLIZbHg=;
 b=3mekd9XppFP+5C04mczS4/WPcYqS/nFAMuoFO9DFIAQqYTzuzAfIvNyDv/kfSx+bpD45qT
 Pgb3voa4MKgQzhAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5498A13A83;
 Fri,  6 Aug 2021 11:38:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8KViFDwfDWGAFwAAMHmgww
 (envelope-from <hare@suse.de>); Fri, 06 Aug 2021 11:38:36 +0000
To: Damien Le Moal <damien.lemoal@wdc.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
References: <20210806111857.488705-1-damien.lemoal@wdc.com>
 <20210806111857.488705-4-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <c035ea17-ae49-99eb-5bab-30733467bf90@suse.de>
Date: Fri, 6 Aug 2021 13:38:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806111857.488705-4-damien.lemoal@wdc.com>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mByBW-00EeXI-JS
Subject: Re: [f2fs-dev] [PATCH v3 3/4] block: rename IOPRIO_BE_NR
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOC82LzIxIDE6MTggUE0sIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IFRoZSBCRlEgc2NoZWR1
bGVyIGFuZCBpb3ByaW9fY2hlY2tfY2FwKCkgYm90aCBhc3N1bWUgdGhhdCB0aGUgUlQKPiBwcmlv
cml0eSBjbGFzcyAoSU9QUklPX0NMQVNTX1JUKSBjYW4gaGF2ZSB1cCB0byA4IGRpZmZlcmVudCBw
cmlvcml0eQo+IGxldmVscy4gVGhpcyBpcyBjb250cm9sbGVkIHVzaW5nIHRoZSBtYWNybyBJT1BS
SU9fQkVfTlIsIHdoaWNoIGlzIGJhZGx5Cj4gbmFtZWQgYXMgdGhlIG51bWJlciBvZiBsZXZlbHMg
YWxzbyBhcHBsaWVzIHRvIHRoZSBSVCBjbGFzcy4KPiAKPiBSZW5hbWUgSU9QUklPX0JFX05SIHRv
IHRoZSBjbGFzcyBpbmRlcGVuZGVudCBJT1BSSU9fTlJfTEVWRUxTIHRvIG1ha2UKPiB0aGluZ3Mg
Y2xlYXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxA
d2RjLmNvbT4KPiAtLS0KPiAgYmxvY2svYmZxLWlvc2NoZWQuYyAgICAgICAgIHwgOCArKysrLS0t
LQo+ICBibG9jay9iZnEtaW9zY2hlZC5oICAgICAgICAgfCA0ICsrLS0KPiAgYmxvY2svYmZxLXdm
MnEuYyAgICAgICAgICAgIHwgNiArKystLS0KPiAgYmxvY2svaW9wcmlvLmMgICAgICAgICAgICAg
IHwgMyArLS0KPiAgZnMvZjJmcy9zeXNmcy5jICAgICAgICAgICAgIHwgMiArLQo+ICBpbmNsdWRl
L3VhcGkvbGludXgvaW9wcmlvLmggfCA0ICsrLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiAKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNr
ZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tl
CQkgICAgICAgICAgIEtlcm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUJCQkgICAg
ICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFH
IE7DvHJuYmVyZyksIEdGOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
