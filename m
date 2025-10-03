Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C94BB634E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Oct 2025 10:03:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:To:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/fvGw+HukmNa+zishKEIMQQHBesd3rQT4sKL+Qgx/uw=; b=YURok7QVHNKRFasHnZhdW+BuLP
	Ytq6/LZyMLotax1meiFe39k/y9FZZEK9LRLctSVg6he+eFX5CFtZAKhzWNZQiEIHcIyw5pR6GO4eM
	cyLUXUU4H7Y8E/Bv9XY0KlWuIQOzSoiuI5JjjzpKCwoU7vQ93R1VjKZd1v4EXabwQEz8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4al6-0001j7-Sb;
	Fri, 03 Oct 2025 08:03:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <adrian.liszka@proventix.pl>) id 1v4al5-0001j1-LI
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 08:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=DdAPblEGcqsDyNO93njfEZtVxX
 HIv9IgbiG21OLoM7KO+AyFEKAeS8qfot8Kjkn/Paa/JlNEht4Bb/6rPKOks9spwed3Vrl0/KiCYcl
 yhnQEZZqr/leO9xf5hHTkcuNdQHudnvsD732X2rPhd7A3lxncrxqsuzhaC5nZuPs+XI0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=I
 vJMmzBCdbnIU21/MNmd3VzVjkXBZmM0mT95tvz3s/mHO6IoVGAtXkEQfCxADF74ZR8ERhKlotm/JF
 Eyo22sccH2ABLO+ObDhrkT7TsCLIhNjJ70bi3hEuOcINzjKp2ubfVy0RQwVoaEgHQEXRAwxoFHvBn
 f+aMYYh2e7K2CA84=;
Received: from mail.proventix.pl ([51.195.118.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v4al4-0005zB-0V for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 08:03:19 +0000
Received: by mail.proventix.pl (Postfix, from userid 1002)
 id BF904A584B; Fri,  3 Oct 2025 10:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=proventix.pl; s=mail;
 t=1759478586; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
 h=Date:From:To:Subject:From;
 b=DBWx79ZjUCIXV72lTJu4gwbgbH/xFnu4Y+q+dntEzm/K6xFNwBYNhR3FIM0667SNw
 EkjLz90geB0E/m14X7y04qjEz44lsEZ2qj0KmZBGcsuvSBxHkE+o/6VzzlHrk4/rup
 74FOCdsI5+fUf9FOiHFdKS+sqfDf4iyjIV+MOY37t2DqXuwpMQ+wvm9FW7uMQy9hIM
 VQmdZ2bElbuSrb4EphbBUKTmlHzTBoaWyy5T3TBWoFbQFbL5WTlozxvIA9Xw2+Zo+R
 iMwEIYHjSu1ZfWlHromVv4VbbM4erntXMry0iRG6cZTjUkSiReR1DmIXR8QSjl1kxm
 kYz2VA9QmVKUg==
Received: by mail.proventix.pl for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  3 Oct 2025 08:01:27 GMT
Message-ID: <20251003084500-0.1.oa.3cwun.0.uhegw2do4i@proventix.pl>
Date: Fri,  3 Oct 2025 08:01:27 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.proventix.pl
MIME-Version: 1.0
X-Spam-Score: 4.1 (++++)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dzień dobry, Czy jest możliwość nawiązania współpracy
    z Państwem? Z chęcią porozmawiam z osobą zajmującą się działaniami
    związanymi ze sprzedażą. 
 
 Content analysis details:   (4.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.3 RCVD_IN_MSPIKE_L3      RBL: Low reputation (-3)
                             [51.195.118.1 listed in bl.mailspike.net]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
                             was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
                              for more information.
                             [51.195.118.1 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  4.0 RCVD_IN_MSPIKE_BL      Mailspike blocklisted
X-Headers-End: 1v4al4-0005zB-0V
Subject: [f2fs-dev] =?utf-8?q?Prosz=C4=99_o_kontakt?=
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
From: Adrian Liszka via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Adrian Liszka <adrian.liszka@proventix.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
