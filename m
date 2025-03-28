Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DEFA745C2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Mar 2025 09:56:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ty5VO-0004EC-18;
	Fri, 28 Mar 2025 08:55:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vincenc.turek@commetrax.com>) id 1ty5VE-0004DR-CX
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 08:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vdHO8YvBK17Mb+rjnMMMnqrXx61uFtvCNBz8M84xHHs=; b=KOhqZLCAppjwU/7IaagNiR1XRE
 D81NKlqzwe7EqHRXbrxWEF3b/6rkDsxo2yP7YUAwh0u6WIKh7bcBAfpYeuahnlHwLkJB2uee+EMcX
 dZRnH0OKABCd5mKQJkWQIEmohzhdQp5xs4boYSTMEg2EcyYNQJHk7SkT3OaHOLxjlQQA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vdHO8YvBK17Mb+rjnMMMnqrXx61uFtvCNBz8M84xHHs=; b=b
 Z5aajFYkxdQg3EduBrklhX5iPfSExsZOeTADcL4xtEbtxiLET/8uUuG7fYv/FuDJ8G4VnVEacepI0
 51TqClsL1bi6vH+oAEc9yXArQ6Hgdk1NSFdJc5W/XxOCQboMi8yltMv9gxQ77ieDaRjhRmnfiiK33
 VLgczZgZYAjohLqE=;
Received: from mail.commetrax.com ([141.95.18.165])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ty5VD-00033h-Vq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 08:55:49 +0000
Received: by mail.commetrax.com (Postfix, from userid 1002)
 id 8E086246A7; Fri, 28 Mar 2025 09:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
 s=mail; t=1743152136;
 bh=vdHO8YvBK17Mb+rjnMMMnqrXx61uFtvCNBz8M84xHHs=;
 h=Date:From:To:Subject:From;
 b=Ph/DU7f2ZOa7GZyBLqkfD+PKSR8FOQ0HUgfqcbrgNvE5bRs5nbopZ8WAFc8NtpMw4
 uKCWjArgg15c8KgtuK7+3m7YFldQPTnlMU9dS2Z+3r5xVPSllzpD7BqdkYoQJEmGDZ
 TenvVi8nDYuD3ZGLbGV2Oq6mhu72oVxiyOeZ7ejUHB1rqVQ7OIPr3OMdjXuTP2zi5t
 Yzn02fp0qUX0xyTwKJaGFGCYRfi4UmmHVda+wu4hfrETWT+9JU2hVo/CBBIjydPXsT
 MrEeQsML3woeutc3yTvqL1/Dm5y/XvGToC6m3gSR7wA/8JC8SavnQYq6dtk2ZRl6dC
 VN4PHRA/ibXvA==
Received: by mail.commetrax.com for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Mar 2025 08:55:30 GMT
Message-ID: <20250328084500-0.1.8p.s996.0.9xj8s0bael@commetrax.com>
Date: Fri, 28 Mar 2025 08:55:30 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.commetrax.com
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, While browsing your offer, I get the impression that packaging
    quality matters to you – it’s not just about protecting the product but
    also about building your brand image. We manufacture HDPE and PP bottles,
    caps, and buckets that work perfectly in the cosmetics, chemical, and food
    industries. They are durable, aesthetically pleasing, and customizable in
    terms of color [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [141.95.18.165 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [141.95.18.165 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1ty5VD-00033h-Vq
Subject: [f2fs-dev] Plastic components and packaging
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
From: Vincenc Turek via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Vincenc Turek <vincenc.turek@commetrax.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgpXaGlsZSBicm93c2luZyB5b3VyIG9mZmVyLCBJIGdldCB0aGUgaW1wcmVzc2lvbiB0aGF0
IHBhY2thZ2luZyBxdWFsaXR5IG1hdHRlcnMgdG8geW91IOKAkyBpdOKAmXMgbm90IGp1c3QgYWJv
dXQgcHJvdGVjdGluZyB0aGUgcHJvZHVjdCBidXQgYWxzbyBhYm91dCBidWlsZGluZyB5b3VyIGJy
YW5kIGltYWdlLgoKV2UgbWFudWZhY3R1cmUgSERQRSBhbmQgUFAgYm90dGxlcywgY2FwcywgYW5k
IGJ1Y2tldHMgdGhhdCB3b3JrIHBlcmZlY3RseSBpbiB0aGUgY29zbWV0aWNzLCBjaGVtaWNhbCwg
YW5kIGZvb2QgaW5kdXN0cmllcy4gVGhleSBhcmUgZHVyYWJsZSwgYWVzdGhldGljYWxseSBwbGVh
c2luZywgYW5kIGN1c3RvbWl6YWJsZSBpbiB0ZXJtcyBvZiBjb2xvciBhbmQgY2xvc3VyZXMgdG8g
cGVyZmVjdGx5IG1hdGNoIHlvdXIgYnJhbmQuCgpMZXQgbWUga25vdyBpZiB5b3XigJlkIGxpa2Ug
dG8gZXhwbG9yZSBzb2x1dGlvbnMgZm9yIHlvdXIgYnVzaW5lc3Mg4oCTIEnigJlkIGJlIGhhcHB5
IHRvIHByZXNlbnQgdGhlIHJpZ2h0IHByb2R1Y3RzLgoKCkJlc3QgcmVnYXJkcwpWaW5jZW5jIFR1
cmVrCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
