Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2462C714D36
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 May 2023 17:38:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3ewh-00089W-D3;
	Mon, 29 May 2023 15:38:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q3ewf-00089Q-Io
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 15:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5x//7WihZJHP1ybBvKd6Troh9+7buiiSd3Ne59BgSEw=; b=Yl1WsBfx655mBTZ3PKvQPkN5oi
 HYMgCpaThqezTRkdrEfxmMg4Mw1TjeY9wjoqU8o+ODHZjHG8p0/b5Kp0c7NAv0/PNlpWhifmXccsr
 FGNWrk6t4oLUUzN7DSgF+jBTQkFrvnHPQ3gfxbRP34oQui00azE6G7TULxF9rD/GUt88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5x//7WihZJHP1ybBvKd6Troh9+7buiiSd3Ne59BgSEw=; b=K7uAjDFroX4YJIcE0UHeRuiWIH
 S5paslTeuK6f3MmHqmHhokQtGZ3KQOYfc4JxuGclepElECFITprSsOHKAj2sIkPEmvsdrnoWpjnwE
 /9+tFAjtBEVhkzV7usC38r4ZGuYFX2KfcpY1+u1P/cHSGZHi2+FaVVZsWEddrR7QIr9Q=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q3ewc-005r4y-9E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 15:38:05 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A13CB1F8B0;
 Mon, 29 May 2023 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685374674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5x//7WihZJHP1ybBvKd6Troh9+7buiiSd3Ne59BgSEw=;
 b=fSpO7ae3VdnMdXRDt9Y0DgiDJbH0T7K3W5P4bBRjL+L/BxE+bLD+2Csqqs4Aw9c6ncV85s
 //0FCpp9/c45UE4B1CzxbNvvJkhIf+47hE8Zdcfv1+N31NNgr2rY+PEBH/9d3SQVwoD+2I
 JS1f4SwRyENJ/I6HnI4mWulU1S2DJZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685374674;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5x//7WihZJHP1ybBvKd6Troh9+7buiiSd3Ne59BgSEw=;
 b=lf3ZWecKucEDCJ60SKDHz/Mb7QuqwTjJgxmnrSoFrZFJtwpPVPzhebfnSEeyqO4LZ5J5MO
 gnAzWelT/f/35kCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81ACD13466;
 Mon, 29 May 2023 15:37:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nRcSH9LGdGQmSAAAMHmgww
 (envelope-from <jack@suse.cz>); Mon, 29 May 2023 15:37:54 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id E43C8A0717; Mon, 29 May 2023 14:42:08 +0200 (CEST)
Date: Mon, 29 May 2023 14:42:08 +0200
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20230529124208.2oou7jt3iitwxk4v@quack3>
References: <20230525100654.15069-1-jack@suse.cz>
 <20230525101624.15814-6-jack@suse.cz>
 <CAOQ4uxhL0w+yqg2u_xW6r4J_gJX=_zoZjo3vh0ONqAbgxm2VTA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhL0w+yqg2u_xW6r4J_gJX=_zoZjo3vh0ONqAbgxm2VTA@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri 26-05-23 15:13:06, Amir Goldstein wrote: > On Thu,
   May 25, 2023 at 1:17 PM Jan Kara <jack@suse.cz> wrote: > > > > Currently
    lock_two_nondirectories() is skipping any passed directories. > > A [...]
    
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.29 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q3ewc-005r4y-9E
Subject: Re: [f2fs-dev] [PATCH 6/6] fs: Restrict lock_two_nondirectories()
 to non-directory inodes
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-fsdevel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpIDI2LTA1LTIzIDE1OjEzOjA2LCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPiBPbiBUaHUs
IE1heSAyNSwgMjAyMyBhdCAxOjE34oCvUE0gSmFuIEthcmEgPGphY2tAc3VzZS5jej4gd3JvdGU6
Cj4gPgo+ID4gQ3VycmVudGx5IGxvY2tfdHdvX25vbmRpcmVjdG9yaWVzKCkgaXMgc2tpcHBpbmcg
YW55IHBhc3NlZCBkaXJlY3Rvcmllcy4KPiA+IEFmdGVyIHZmc19yZW5hbWUoKSB1c2VzIGxvY2tf
dHdvX2lub2RlcygpLCBhbGwgdGhlIHJlbWFpbmluZyBmb3VyIHVzZXJzCj4gPiBvZiB0aGlzIGZ1
bmN0aW9uIHBhc3Mgb25seSByZWd1bGFyIGZpbGVzIHRvIGl0LiBTbyBkcm9wIHRoZSBzb21ld2hh
dAo+ID4gdW51c3VhbCAic2tpcCBkaXJlY3RvcnkiIGxvZ2ljIGFuZCBpbnN0ZWFkIHdhcm4gaWYg
YW55Ym9keSBwYXNzZXMKPiA+IGRpcmVjdG9yeSB0byBpdC4gVGhpcyBhbHNvIGFsbG93cyB1cyB0
byB1c2UgbG9ja190d29faW5vZGVzKCkgaW4KPiA+IGxvY2tfdHdvX25vbmRpcmVjdG9yaWVzKCkg
dG8gY29uY2VudHJhdGUgdGhlIGxvY2sgb3JkZXJpbmcgbG9naWMgaW4gbGVzcwo+ID4gcGxhY2Vz
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Cj4gPiAtLS0K
PiA+ICBmcy9pbm9kZS5jIHwgMTIgKysrKy0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvaW5v
ZGUuYyBiL2ZzL2lub2RlLmMKPiA+IGluZGV4IDIwMTVmYTUwZDM0YS4uYWNjZjUxMjVhMDQ5IDEw
MDY0NAo+ID4gLS0tIGEvZnMvaW5vZGUuYwo+ID4gKysrIGIvZnMvaW5vZGUuYwo+ID4gQEAgLTEx
NDAsNyArMTE0MCw3IEBAIHZvaWQgbG9ja190d29faW5vZGVzKHN0cnVjdCBpbm9kZSAqaW5vZGUx
LCBzdHJ1Y3QgaW5vZGUgKmlub2RlMiwKPiA+ICAvKioKPiA+ICAgKiBsb2NrX3R3b19ub25kaXJl
Y3RvcmllcyAtIHRha2UgdHdvIGlfbXV0ZXhlcyBvbiBub24tZGlyZWN0b3J5IG9iamVjdHMKPiA+
ICAgKgo+ID4gLSAqIExvY2sgYW55IG5vbi1OVUxMIGFyZ3VtZW50IHRoYXQgaXMgbm90IGEgZGly
ZWN0b3J5Lgo+ID4gKyAqIExvY2sgYW55IG5vbi1OVUxMIGFyZ3VtZW50LiBQYXNzZWQgb2JqZWN0
cyBtdXN0IG5vdCBiZSBkaXJlY3Rvcmllcy4KPiA+ICAgKiBaZXJvLCBvbmUgb3IgdHdvIG9iamVj
dHMgbWF5IGJlIGxvY2tlZCBieSB0aGlzIGZ1bmN0aW9uLgo+ID4gICAqCj4gPiAgICogQGlub2Rl
MTogZmlyc3QgaW5vZGUgdG8gbG9jawo+ID4gQEAgLTExNDgsMTMgKzExNDgsOSBAQCB2b2lkIGxv
Y2tfdHdvX2lub2RlcyhzdHJ1Y3QgaW5vZGUgKmlub2RlMSwgc3RydWN0IGlub2RlICppbm9kZTIs
Cj4gPiAgICovCj4gPiAgdm9pZCBsb2NrX3R3b19ub25kaXJlY3RvcmllcyhzdHJ1Y3QgaW5vZGUg
Kmlub2RlMSwgc3RydWN0IGlub2RlICppbm9kZTIpCj4gPiAgewo+ID4gLSAgICAgICBpZiAoaW5v
ZGUxID4gaW5vZGUyKQo+ID4gLSAgICAgICAgICAgICAgIHN3YXAoaW5vZGUxLCBpbm9kZTIpOwo+
ID4gLQo+ID4gLSAgICAgICBpZiAoaW5vZGUxICYmICFTX0lTRElSKGlub2RlMS0+aV9tb2RlKSkK
PiA+IC0gICAgICAgICAgICAgICBpbm9kZV9sb2NrKGlub2RlMSk7Cj4gPiAtICAgICAgIGlmIChp
bm9kZTIgJiYgIVNfSVNESVIoaW5vZGUyLT5pX21vZGUpICYmIGlub2RlMiAhPSBpbm9kZTEpCj4g
PiAtICAgICAgICAgICAgICAgaW5vZGVfbG9ja19uZXN0ZWQoaW5vZGUyLCBJX01VVEVYX05PTkRJ
UjIpOwo+ID4gKyAgICAgICBXQVJOX09OX09OQ0UoU19JU0RJUihpbm9kZTEtPmlfbW9kZSkpOwo+
ID4gKyAgICAgICBXQVJOX09OX09OQ0UoU19JU0RJUihpbm9kZTItPmlfbW9kZSkpOwo+ID4gKyAg
ICAgICBsb2NrX3R3b19pbm9kZXMoaW5vZGUxLCBpbm9kZTIsIElfTVVURVhfTk9STUFMLCBJX01V
VEVYX05PTkRJUjIpOwo+ID4gIH0KPiA+ICBFWFBPUlRfU1lNQk9MKGxvY2tfdHdvX25vbmRpcmVj
dG9yaWVzKTsKPiA+Cj4gCj4gTmVlZCB0aGUgc2FtZSB0cmVhdG1lbnQgdG8gdW5sb2NrX3R3b19u
b25kaXJlY3RvcmllcygpIGJlY2F1c2Ugbm93IGlmCj4gc29tZW9uZSBkb2VzIHBhc3MgYSBkaXJl
Y3RvcnkgdGhleSB3aWxsIGdldCBhIHdhcm5pbmcgYnV0IGFsc28gYSBsZWFrZWQgbG9jay4KClll
cywgcHJvYmFibHkgdGhhdCBpcyBnb29kIGRlZmVuc2l2ZSBwcm9ncmFtbWluZy4gSSdsbCB1cGRh
dGUgdGhlIHBhdGNoLgoKCQkJCQkJCQlIb256YQotLSAKSmFuIEthcmEgPGphY2tAc3VzZS5jb20+
ClNVU0UgTGFicywgQ1IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
