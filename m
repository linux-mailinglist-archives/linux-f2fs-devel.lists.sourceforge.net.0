Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG/tEAi/cGkRZgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 12:56:56 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF81565E7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 12:56:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:Date:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q78JQg+sJEv69i/2kCGHCze8LBvAfUiQ22CTFlyFZUY=; b=BMtcTw/duthE11b9zJhXzDv+Pb
	GcEaUfLNe7de1JFPCNW2uejx1abJq6qwr1fqZF1b77LUh2DlXueXNZ0waf9JNry4nmpT4pYsPqDZk
	CTUfsw+3q9iFm604fgkuB5PUAYllhIlafxT86bkvfsx0t9sOSm/cipgjOHuNhd+20xEw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viWpI-0001Td-Tw;
	Wed, 21 Jan 2026 11:56:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1viWpG-0001TK-Q6;
 Wed, 21 Jan 2026 11:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6sbo+jEpSGIem10pQXyg5HOLTK5v6jQ4zjJduurf2EM=; b=DoOgDCEZ/q9mSSjv2c7Vs5DZI4
 dO/vNSwxJ65YwWIMsXt5nwT2jMDsq/6dnA48309GcEx7aR81adg1We0/ARJZ+9OuKW+a4Yyf8jO66
 v1xDMYvvOLKKGwwv0MtfUk9/hgjcKaaoOl++CpDN72PDbbv6UAYielfT3hNpZJ6F7Zxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6sbo+jEpSGIem10pQXyg5HOLTK5v6jQ4zjJduurf2EM=; b=DK2jl0Xd/4qOFn5uroFM/lvw/0
 pAk4csvvnU3EceaRg4/9nx0tOF29vZV4++Lv3mCWYbbjrrT5InGl7SgQHEgiwUNNDXRbtadmZJIRu
 ke2jUZ+3FWWkzBiV1r0odx9Zv7zGc2TiIl9GYt1KaETW6ChAbVAqyz2eChhcLdrIx9gc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viWpF-0000mX-ID; Wed, 21 Jan 2026 11:56:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7A254600AA;
 Wed, 21 Jan 2026 11:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66C2C116D0;
 Wed, 21 Jan 2026 11:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768996590;
 bh=s/nN+L4tO0ReDIA8U1XnXBFUBSeAf8wqtBg+Qg7q5K4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=o7pt8lYKcUwkZvaQYgMOv1MWde4CBIVwy9O43WuDtOJkfnyhx+ILjgaeVDsOB+n90
 Wzv3lDFAv2Yi2u489yNATguHULfFyCtdbQQ6tXlpv4795y7peYcCGAUVncgMrN5p3a
 IxqDgkJQpFmkx63hA1fZV6u1Kcyew1+GSTlkgVnpzLn7uScpHcGW2vSaF60Q6y48CC
 Jfic/yn5QBazLrPcnDuzuXeiu5nFNS1Itu4mHSga96VVOMKQI0UziTWm+ljaiesjOU
 geoVzVwprwRYHhzxB9PrHzj9d6BcoiRGNR8Vk6s4aBGy7uWtGPTvI19A9Lm+XRweyG
 j8vwsVKIsxu9Q==
Message-ID: <ccb32c576cc4ebf943d5ec35e3d7ba4ae8892acd.camel@kernel.org>
To: NeilBrown <neil@brown.name>
Date: Wed, 21 Jan 2026 06:56:22 -0500
In-Reply-To: <176896790525.16766.11792073987699294594@noble.neil.brown.name>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 , <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 , <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>
 , <176877859306.16766.15009835437490907207@noble.neil.brown.name>
 , <aW3SAKIr_QsnEE5Q@infradead.org>
 , <176880736225.16766.4203157325432990313@noble.neil.brown.name>
 , <20260119-kanufahren-meerjungfrau-775048806544@brauner>
 , <176885553525.16766.291581709413217562@noble.neil.brown.name>
 , <20260120-entmilitarisieren-wanken-afd04b910897@brauner>
 , <176890211061.16766.16354247063052030403@noble.neil.brown.name>
 , <20260120-hacken-revision-88209121ac2c@brauner>
 , <a35ac736d9ebc6c92a6e7d61aeb5198234102442.camel@kernel.org>
 <176896790525.16766.11792073987699294594@noble.neil.brown.name>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=mQINBE6V0TwBEADXhJg7s8wFDwBMEvn0qyhAnzFLTOCHooMZyx7XO7dAiIhDSi7G1NPxw
 n8jdFUQMCR/GlpozMFlSFiZXiObE7sef9rTtM68ukUyZM4pJ9l0KjQNgDJ6Fr342Htkjxu/kFV1Wv
 egyjnSsFt7EGoDjdKqr1TS9syJYFjagYtvWk/UfHlW09X+jOh4vYtfX7iYSx/NfqV3W1D7EDi0PqV
 T2h6v8i8YqsATFPwO4nuiTmL6I40ZofxVd+9wdRI4Db8yUNA4ZSP2nqLcLtFjClYRBoJvRWvsv4lm
 0OX6MYPtv76hka8lW4mnRmZqqx3UtfHX/hF/zH24Gj7A6sYKYLCU3YrI2Ogiu7/ksKcl7goQjpvtV
 YrOOI5VGLHge0awt7bhMCTM9KAfPc+xL/ZxAMVWd3NCk5SamL2cE99UWgtvNOIYU8m6EjTLhsj8sn
 VluJH0/RcxEeFbnSaswVChNSGa7mXJrTR22lRL6ZPjdMgS2Km90haWPRc8Wolcz07Y2se0xpGVLEQ
 cDEsvv5IMmeMe1/qLZ6NaVkNuL3WOXvxaVT9USW1+/SGipO2IpKJjeDZfehlB/kpfF24+RrK+seQf
 CBYyUE8QJpvTZyfUHNYldXlrjO6n5MdOempLqWpfOmcGkwnyNRBR46g/jf8KnPRwXs509yAqDB6sE
 LZH+yWr9LQZEwARAQABtCVKZWZmIExheXRvbiA8amxheXRvbkBwb29jaGllcmVkcy5uZXQ+iQI7BB
 MBAgAlAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUCTpXWPAIZAQAKCRAADmhBGVaCFc65D/4
 gBLNMHopQYgG/9RIM3kgFCCQV0pLv0hcg1cjr+bPI5f1PzJoOVi9s0wBDHwp8+vtHgYhM54yt43uI
 7Htij0RHFL5eFqoVT4TSfAg2qlvNemJEOY0e4daljjmZM7UtmpGs9NN0r9r50W82eb5Kw5bc/r0km
 R/arUS2st+ecRsCnwAOj6HiURwIgfDMHGPtSkoPpu3DDp/cjcYUg3HaOJuTjtGHFH963B+f+hyQ2B
 rQZBBE76ErgTDJ2Db9Ey0kw7VEZ4I2nnVUY9B5dE2pJFVO5HJBMp30fUGKvwaKqYCU2iAKxdmJXRI
 ONb7dSde8LqZahuunPDMZyMA5+mkQl7kpIpR6kVDIiqmxzRuPeiMP7O2FCUlS2DnJnRVrHmCljLkZ
 Wf7ZUA22wJpepBligemtSRSbqCyZ3B48zJ8g5B8xLEntPo/NknSJaYRvfEQqGxgk5kkNWMIMDkfQO
 lDSXZvoxqU9wFH/9jTv1/6p8dHeGM0BsbBLMqQaqnWiVt5mG92E1zkOW69LnoozE6Le+12DsNW7Rj
 iR5K+27MObjXEYIW7FIvNN/TQ6U1EOsdxwB8o//Yfc3p2QqPr5uS93SDDan5ehH59BnHpguTc27Xi
 QQZ9EGiieCUx6Zh2ze3X2UW9YNzE15uKwkkuEIj60NvQRmEDfweYfOfPVOueC+iFifbQgSmVmZiBM
 YXl0b24gPGpsYXl0b25AcmVkaGF0LmNvbT6JAjgEEwECACIFAk6V0q0CGwMGCwkIBwMCBhUIAgkKC
 wQWAgMBAh4BAheAAAoJEAAOaEEZVoIViKUQALpvsacTMWWOd7SlPFzIYy2/fjvKlfB/Xs4YdNcf9q
 LqF+lk2RBUHdR/dGwZpvw/OLmnZ8TryDo2zXVJNWEEUFNc7wQpl3i78r6UU/GUY/RQmOgPhs3epQC
 3PMJj4xFx+VuVcf/MXgDDdBUHaCTT793hyBeDbQuciARDJAW24Q1RCmjcwWIV/pgrlFa4lAXsmhoa
 c8UPc82Ijrs6ivlTweFf16VBc4nSLX5FB3ls7S5noRhm5/Zsd4PGPgIHgCZcPgkAnU1S/A/rSqf3F
 LpU+CbVBDvlVAnOq9gfNF+QiTlOHdZVIe4gEYAU3CUjbleywQqV02BKxPVM0C5/oVjMVx3bri75n1
 TkBYGmqAXy9usCkHIsG5CBHmphv9MHmqMZQVsxvCzfnI5IO1+7MoloeeW/lxuyd0pU88dZsV/riHw
 87i2GJUJtVlMl5IGBNFpqoNUoqmvRfEMeXhy/kUX4Xc03I1coZIgmwLmCSXwx9MaCPFzV/dOOrju2
 xjO+2sYyB5BNtxRqUEyXglpujFZqJxxau7E0eXoYgoY9gtFGsspzFkVNntamVXEWVVgzJJr/EWW0y
 +jNd54MfPRqH+eCGuqlnNLktSAVz1MvVRY1dxUltSlDZT7P2bUoMorIPu8p7ZCg9dyX1+9T6Muc5d
 Hxf/BBP/ir+3e8JTFQBFOiLNdFtB9KZWZmIExheXRvbiA8amxheXRvbkBzYW1iYS5vcmc+iQI4BBM
 BAgAiBQJOldK9AhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRAADmhBGVaCFWgWD/0ZRi4h
 N9FK2BdQs9RwNnFZUr7JidAWfCrs37XrA/56olQl3ojn0fQtrP4DbTmCuh0SfMijB24psy1GnkPep
 naQ6VRf7Dxg/Y8muZELSOtsv2CKt3/02J1BBitrkkqmHyni5fLLYYg6fub0T/8Kwo1qGPdu1hx2BQ
 RERYtQ/S5d/T0cACdlzi6w8rs5f09hU9Tu4qV1JLKmBTgUWKN969HPRkxiojLQziHVyM/weR5Reu6
 FZVNuVBGqBD+sfk/c98VJHjsQhYJijcsmgMb1NohAzwrBKcSGKOWJToGEO/1RkIN8tqGnYNp2G+aR
 685D0chgTl1WzPRM6mFG1+n2b2RR95DxumKVpwBwdLPoCkI24JkeDJ7lXSe3uFWISstFGt0HL8Eew
 P8RuGC8s5h7Ct91HMNQTbjgA+Vi1foWUVXpEintAKgoywaIDlJfTZIl6Ew8ETN/7DLy8bXYgq0Xzh
 aKg3CnOUuGQV5/nl4OAX/3jocT5Cz/OtAiNYj5mLPeL5z2ZszjoCAH6caqsF2oLyAnLqRgDgR+wTQ
 T6gMhr2IRsl+cp8gPHBwQ4uZMb+X00c/Amm9VfviT+BI7B66cnC7Zv6Gvmtu2rEjWDGWPqUgccB7h
 dMKnKDthkA227/82tYoFiFMb/NwtgGrn5n2vwJyKN6SEoygGrNt0SI84y6hEVbQlSmVmZiBMYXl0b
 24gPGpsYXl0b25AcHJpbWFyeWRhdGEuY29tPokCOQQTAQIAIwUCU4xmKQIbAwcLCQgHAwIBBhUIAg
 kKCwQWAgMBAh4BAheAAAoJEAAOaEEZVoIV1H0P/j4OUTwFd7BBbpoSp695qb6HqCzWMuExsp8nZjr
 uymMaeZbGr3OWMNEXRI1FWNHMtcMHWLP/RaDqCJil28proO+PQ/yPhsr2QqJcW4nr91tBrv/MqItu
 AXLYlsgXqp4BxLP67bzRJ1Bd2x0bWXurpEXY//VBOLnODqThGEcL7jouwjmnRh9FTKZfBDpFRaEfD
 FOXIfAkMKBa/c9TQwRpx2DPsl3eFWVCNuNGKeGsirLqCxUg5kWTxEorROppz9oU4HPicL6rRH22Ce
 6nOAON2vHvhkUuO3GbffhrcsPD4DaYup4ic+DxWm+DaSSRJ+e1yJvwi6NmQ9P9UAuLG93S2MdNNbo
 sZ9P8k2mTOVKMc+GooI9Ve/vH8unwitwo7ORMVXhJeU6Q0X7zf3SjwDq2lBhn1DSuTsn2DbsNTiDv
 qrAaCvbsTsw+SZRwF85eG67eAwouYk+dnKmp1q57LDKMyzysij2oDKbcBlwB/TeX16p8+LxECv51a
 sjS9TInnipssssUDrHIvoTTXWcz7Y5wIngxDFwT8rPY3EggzLGfK5Zx2Q5S/N0FfmADmKknG/D8qG
 IcJE574D956tiUDKN4I+/g125ORR1v7bP+OIaayAvq17RP+qcAqkxc0x8iCYVCYDouDyNvWPGRhbL
 UO7mlBpjW9jK9e2fvZY9iw3QzIPGKtClKZWZmIExheXRvbiA8amVmZi5sYXl0b25AcHJpbWFyeWRh
 dGEuY29tPokCOQQTAQIAIwUCU4xmUAIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEAAOa
 EEZVoIVzJoQALFCS6n/FHQS+hIzHIb56JbokhK0AFqoLVzLKzrnaeXhE5isWcVg0eoV2oTScIwUSU
 apy94if69tnUo4Q7YNt8/6yFM6hwZAxFjOXR0ciGE3Q+Z1zi49Ox51yjGMQGxlakV9ep4sV/d5a50
 M+LFTmYSAFp6HY23JN9PkjVJC4PUv5DYRbOZ6Y1+TfXKBAewMVqtwT1Y+LPlfmI8dbbbuUX/kKZ5d
 dhV2736fgyfpslvJKYl0YifUOVy4D1G/oSycyHkJG78OvX4JKcf2kKzVvg7/Rnv+AueCfFQ6nGwPn
 0P91I7TEOC4XfZ6a1K3uTp4fPPs1Wn75X7K8lzJP/p8lme40uqwAyBjk+IA5VGd+CVRiyJTpGZwA0
 jwSYLyXboX+Dqm9pSYzmC9+/AE7lIgpWj+3iNisp1SWtHc4pdtQ5EU2SEz8yKvDbD0lNDbv4ljI7e
 flPsvN6vOrxz24mCliEco5DwhpaaSnzWnbAPXhQDWb/lUgs/JNk8dtwmvWnqCwRqElMLVisAbJmC0
 BhZ/Ab4sph3EaiZfdXKhiQqSGdK4La3OTJOJYZphPdGgnkvDV9Pl1QZ0ijXQrVIy3zd6VCNaKYq7B
 AKidn5g/2Q8oio9Tf4XfdZ9dtwcB+bwDJFgvvDYaZ5bI3ln4V3EyW5i2NfXazz/GA/I/ZtbsigCFc
 8ftCBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPokCOAQTAQIAIgUCWe8u6AIbAwYLCQg
 HAwIGFQgCCQoLBBYCAwECHgECF4AACgkQAA5oQRlWghUuCg/+Lb/xGxZD2Q1oJVAE37uW308UpVSD
 2tAMJUvFTdDbfe3zKlPDTuVsyNsALBGclPLagJ5ZTP+Vp2irAN9uwBuacBOTtmOdz4ZN2tdvNgozz
 uxp4CHBDVzAslUi2idy+xpsp47DWPxYFIRP3M8QG/aNW052LaPc0cedYxp8+9eiVUNpxF4SiU4i9J
 DfX/sn9XcfoVZIxMpCRE750zvJvcCUz9HojsrMQ1NFc7MFT1z3MOW2/RlzPcog7xvR5ENPH19ojRD
 CHqumUHRry+RF0lH00clzX/W8OrQJZtoBPXv9ahka/Vp7kEulcBJr1cH5Wz/WprhsIM7U9pse1f1g
 Yy9YbXtWctUz8uvDR7shsQxAhX3qO7DilMtuGo1v97I/Kx4gXQ52syh/w6EBny71CZrOgD6kJwPVV
 AaM1LRC28muq91WCFhs/nzHozpbzcheyGtMUI2Ao4K6mnY+3zIuXPygZMFr9KXE6fF7HzKxKuZMJO
 aEZCiDOq0anx6FmOzs5E6Jqdpo/mtI8beK+BE7Va6ni7YrQlnT0i3vaTVMTiCThbqsB20VrbMjlhp
 f8lfK1XVNbRq/R7GZ9zHESlsa35ha60yd/j3pu5hT2xyy8krV8vGhHvnJ1XRMJBAB/UYb6FyC7S+m
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 2026-01-21 at 14:58 +1100, NeilBrown wrote: > On Tue,
 20 Jan 2026, Jeff Layton wrote: > > On Tue, 2026-01-20 at 11:31 +0100,
 Christian
 Brauner wrote: > > > On Tue, Jan 20, 2026 at 08:41:50PM + [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1viWpF-0000mX-ID
Subject: Re: [f2fs-dev] [PATCH 00/29] fs: require filesystems to explicitly
 opt-in to nfsd export support
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
From: Jeff Layton via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jeff Layton <jlayton@kernel.org>
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[71];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[omnibond.com,lists.sourceforge.net,suse.cz,manguebit.org,redhat.com,google.com,vger.kernel.org,kernel.org,gmail.com,paragon-software.com,fb.com,dilger.ca,vivo.com,lists.infradead.org,szeredi.hu,nod.at,fasheh.com,oracle.com,infradead.org,dubeyko.com,kvack.org,lists.orangefs.org,microsoft.com,talpey.com,lists.linux.dev,suse.com,zeniv.linux.org.uk,linux.alibaba.com,mail.parknet.co.jp,mit.edu,lists.ozlabs.org,samba.org,huawei.com,squashfs.org.uk,linux-foundation.org,evilplan.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jlayton@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 4CF81565E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCAyMDI2LTAxLTIxIGF0IDE0OjU4ICsxMTAwLCBOZWlsQnJvd24gd3JvdGU6Cj4gT24g
VHVlLCAyMCBKYW4gMjAyNiwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gPiBPbiBUdWUsIDIwMjYtMDEt
MjAgYXQgMTE6MzEgKzAxMDAsIENocmlzdGlhbiBCcmF1bmVyIHdyb3RlOgo+ID4gPiBPbiBUdWUs
IEphbiAyMCwgMjAyNiBhdCAwODo0MTo1MFBNICsxMTAwLCBOZWlsQnJvd24gd3JvdGU6Cj4gPiA+
ID4gT24gVHVlLCAyMCBKYW4gMjAyNiwgQ2hyaXN0aWFuIEJyYXVuZXIgd3JvdGU6Cj4gPiA+ID4g
PiBPbiBUdWUsIEphbiAyMCwgMjAyNiBhdCAwNzo0NTozNUFNICsxMTAwLCBOZWlsQnJvd24gd3Jv
dGU6Cj4gPiA+ID4gPiA+IE9uIE1vbiwgMTkgSmFuIDIwMjYsIENocmlzdGlhbiBCcmF1bmVyIHdy
b3RlOgo+ID4gPiA+ID4gPiA+IE9uIE1vbiwgSmFuIDE5LCAyMDI2IGF0IDA2OjIyOjQyUE0gKzEx
MDAsIE5laWxCcm93biB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IE9uIE1vbiwgMTkgSmFuIDIwMjYs
IENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiBPbiBNb24sIEphbiAx
OSwgMjAyNiBhdCAxMDoyMzoxM0FNICsxMTAwLCBOZWlsQnJvd24gd3JvdGU6Cj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiBUaGlzIHdhcyBDaHVjaydzIHN1Z2dlc3RlZCBuYW1lLiBIaXMgcG9pbnQgd2Fz
IHRoYXQgU1RBQkxFIG1lYW5zIHRoYXQKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IHRoZSBGSCdzIGRv
bid0IGNoYW5nZSBkdXJpbmcgdGhlIGxpZmV0aW1lIG9mIHRoZSBmaWxlLgo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBJIGRvbid0IG11Y2ggY2FyZSBhYm91dCB0
aGUgZmxhZyBuYW1lLCBzbyBpZiBldmVyeW9uZSBsaWtlcyBQRVJTSVNURU5UCj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiBiZXR0ZXIgSSdsbCByb2xsIHdpdGggdGhhdC4KPiA+ID4gPiA+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiA+ID4gPiBJIGRvbid0IGxpa2UgUEVSU0lTVEVOVC4KPiA+ID4gPiA+
ID4gPiA+ID4gPiBJJ2QgcmF0aGVyIGNhbGwgYSBzcGFkZSBhIHNwYWRlLgo+ID4gPiA+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgRVhQT1JUX09QX1NVUFBPUlRTX05GU19FWFBP
UlQKPiA+ID4gPiA+ID4gPiA+ID4gPiBvcgo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgRVhQT1JUX09Q
X05PVF9ORlNfQ09NUEFUSUJMRQo+ID4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4g
PiA+IFRoZSBpc3N1ZSBoZXJlIGlzIE5GUyBleHBvcnQgYW5kIGluZGlyZWN0aW9uIGRvZXNuJ3Qg
YnJpbmcgYW55IGJlbmVmaXRzLgo+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4g
Tm8sIGl0IGFic29sdXRlbHkgaXMgbm90LiAgQW5kIHRoZSB3aG9sZSBjb25jZXB0IG9mIGNhbGxp
bmcgc29tZXRoaW5nCj4gPiA+ID4gPiA+ID4gPiA+IGFmdGVyIHRoZSBpbml0aWFsIG9yIG1haW4g
dXNlIGlzIGEgcmVjaXBlIGZvciBhIG1lc3MuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
PiA+IFdlIGFyZSBjYWxsaW5nIGl0IGZvciBpdCdzIG9ubHkgdXNlLiAgSWYgdGhlcmUgd2FzIGV2
ZXIgYW5vdGhlciB1c2UsIHdlCj4gPiA+ID4gPiA+ID4gPiBjb3VsZCBjaGFuZ2UgdGhlIG5hbWUg
aWYgdGhhdCBtYWRlIHNlbnNlLiAgSXQgaXMgbm90IGEgcHVibGljIG5hbWUsIGl0Cj4gPiA+ID4g
PiA+ID4gPiBpcyBlYXN5IHRvIGNoYW5nZS4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+
ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gUGljayBhIG5hbWUgdGhhdCBjb252ZXlzIHdoYXQgdGhl
IGZsYWcgaXMgYWJvdXQsIGFuZCBkb2N1bWVudCB0aG9zZQo+ID4gPiA+ID4gPiA+ID4gPiBzZW1h
bnRpY3Mgd2VsbC4gIFRoaXMgZmxhZyBpcyBhYm91dCB0aGUgZmFjdCB0aGF0IGZvciBhIGdpdmVu
IGZpbGUsCj4gPiA+ID4gPiA+ID4gPiA+IGFzIGxvbmcgYXMgdGhhdCBmaWxlIGV4aXN0cyBpbiB0
aGUgZmlsZSBzeXN0ZW0gdGhlIGhhbmRsZSBpcyBzdGFibGUuCj4gPiA+ID4gPiA+ID4gPiA+IEJv
dGggc3RhYmxlIGFuZCBwZXJzaXN0ZW50IGFyZSBzdWl0YWJsZSBmb3IgdGhhdCwgbmZzIGlzIGV2
ZXJ5dGhpbmcKPiA+ID4gPiA+ID4gPiA+ID4gYnV0Lgo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQga2VybmZzIHdvdWxkIG5vdCBnZXQgdGhl
IGZsYWcuCj4gPiA+ID4gPiA+ID4gPiBrZXJuZnMgZmlsZWhhbmRsZXMgZG8gbm90IGNoYW5nZSBh
cyBsb25nIGFzIHRoZSBmaWxlIGV4aXN0Lgo+ID4gPiA+ID4gPiA+ID4gQnV0IHRoaXMgaXMgbm90
IHN1ZmZpY2llbnQgZm9yIHRoZSBmaWxlcyB0byBiZSB1c2VmdWxseSBleHBvcnRlZC4KPiA+ID4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gSSBzdXNwZWN0IGtlcm5mcyBkb2VzIHJlLXVzZSBm
aWxlaGFuZGxlcyByZWxhdGl2ZWx5IHNvb24gYWZ0ZXIgdGhlCj4gPiA+ID4gPiA+ID4gPiBmaWxl
L29iamVjdCBoYXMgYmVlbiBkZXN0cm95ZWQuICBNYXliZSB0aGF0IGlzIHRoZSByZWFsIHByb2Js
ZW0gaGVyZToKPiA+ID4gPiA+ID4gPiA+IGZpbGVoYW5kbGUgcmV1c2UsIG5vdCBmaWxlaGFuZGxl
IHN0YWJpbGl0eS4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gSmVmZjogY291bGQg
eW91IHBsZWFzZSBnaXZlIGRldGFpbHMgKGFuZCBwcmVzZXJ2ZSB0aGVtIGluIGZ1dHVyZSBjb3Zl
cgo+ID4gPiA+ID4gPiA+ID4gbGV0dGVycykgb2Ygd2hpY2ggZmlsZXN5c3RlbXMgYXJlIGtub3du
IHRvIGhhdmUgcHJvYmxlbXMgYW5kIHdoYXQKPiA+ID4gPiA+ID4gPiA+IGV4YWN0bHkgdGhvc2Ug
cHJvYmxlbXMgYXJlPwo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiA+ID4gPiBSZW1lbWJlciBuZnMgYWxzbyBzdXBwb3J0IHZvbGF0aWxlIGZpbGUgaGFuZGxl
cywgYW5kIG90aGVyIGFwcGxpY2F0aW9ucwo+ID4gPiA+ID4gPiA+ID4gPiBtaWdodCByZWx5IG9u
IHRoaXMgKEkga25vdyBvZiBxdWl0ZSBhIGZldyB1c2VyIHNwYWNlIGFwcGxpY2F0aW9ucyB0aGF0
Cj4gPiA+ID4gPiA+ID4gPiA+IGRvLCBidXQgdGhleSBhcmUga2luZGEgaGFyZHdpcmVkIHRvIHhm
cyBhbnl3YXkpLgo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBUaGUgTkZTIHByb3Rv
Y29sIHN1cHBvcnRzIHZvbGF0aWxlIGZpbGUgaGFuZGxlcy4gIGtuZnNkIGRvZXMgbm90Lgo+ID4g
PiA+ID4gPiA+ID4gU28gbWF5YmUKPiA+ID4gPiA+ID4gPiA+ICAgRVhQT1JUX09QX05PVF9ORlNE
X0NPTVBBVElCTEUKPiA+ID4gPiA+ID4gPiA+IG1pZ2h0IGJlIGJldHRlci4gIG9yIEVYUE9SVF9P
UF9OT1RfTElOVVhfTkZTRF9DT01QQVRJQkxFLgo+ID4gPiA+ID4gPiA+ID4gKEkgcHJlZmVyIG9w
dC1vdXQgcmF0aGVyIHRoYW4gb3B0LWluIGJlY2F1c2UgbmZzZCBleHBvcnQgd2FzIHRoZQo+ID4g
PiA+ID4gPiA+ID4gb3JpZ2luYWwgcHVycG9zZSBvZiBleHBvcnRfb3BlcmF0aW9ucywgYnV0IGl0
IGlzbid0IHNvbWV0aGluZwo+ID4gPiA+ID4gPiA+ID4gSSB3b3VsZCBmaWdodCBmb3IpCj4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gSSBwcmVmZXIgb25lIG9mIHRoZSB2YXJpYW50cyB5b3Ug
cHJvcG9zZWQgaGVyZSBidXQgSSBkb24ndCBwYXJ0aWN1bGFybHkKPiA+ID4gPiA+ID4gPiBjYXJl
LiBJdCdzIG5vdCBhIGhpbGwgd29ydGggZHlpbmcgb24uIFNvIGlmIENocmlzdG9waCBpbnNpc3Rz
IG9uIHRoZQo+ID4gPiA+ID4gPiA+IG90aGVyIG5hbWUgdGhlbiBJIHNheSBsZXQncyBqdXN0IGdv
IHdpdGggaXQuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBUaGlzIHNv
dW5kcyBsaWtlIHlvdSBhcmUgcmVjb21tZW5kaW5nIHRoYXQgd2UgZ2l2ZSBpbiB0byBidWxseWlu
Zy4KPiA+ID4gPiA+ID4gSSB3b3VsZCByYXRoZXIgdGhlIGRlY2lzaW9uIGJlIG1hZGUgYmFzZWQg
b24gdGhlIGZhY3RzIG9mIHRoZSBjYXNlLCBub3QKPiA+ID4gPiA+ID4gdGhlIG9waW5pb25zIHRo
YXQgYXJlIHN0YXRlZCBtb3N0IGJsdW50bHkuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJIGFj
dHVhbGx5IHRoaW5rIHRoYXQgd2hhdCBDaHJpc3RvcGggd2FudHMgaXMgYWN0dWFsbHkgcXVpdGUg
ZGlmZmVyZW50Cj4gPiA+ID4gPiA+IGZyb20gd2hhdCBKZWZmIHdhbnRzLCBhbmQgbWF5YmUgdHdv
IGZsYWdzIGFyZSBuZWVkZWQuICBCdXQgSSBkb24ndCB5ZXQKPiA+ID4gPiA+ID4gaGF2ZSBhIGNs
ZWFyIHVuZGVyc3RhbmRpbmcgb2Ygd2hhdCBDaHJpc3RvcGggd2FudHMsIHNvIEkgY2Fubm90IGJl
IHN1cmUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkndmUgdHJpZWQgdG8gaW5kaXJlY3RseSBhc2sg
d2hldGhlciB5b3Ugd291bGQgYmUgd2lsbGluZyB0byBjb21wcm9taXNlCj4gPiA+ID4gPiBoZXJl
IG9yIHdoZXRoZXIgeW91IHdhbnQgdG8gaW5zaXN0IG9uIHlvdXIgYWx0ZXJuYXRpdmUgbmFtZS4g
QXBwYXJlbnRseQo+ID4gPiA+ID4gdGhhdCBkaWRuJ3QgY29tZSB0aHJvdWdoLgo+ID4gPiA+IAo+
ID4gPiA+IFRoaXMgd291bGQgYmUgdGhlICJub3QgYSBoaWxsIHdvcnRoeSBkeWluZyBvbiIgcGFy
dCBvZiB5b3VyIHN0YXRlbWVudC4KPiA+ID4gPiBJIHRoaW5rIEkgc2VlIHRoYXQgaW1wbGljYXRp
b24gbm93Lgo+ID4gPiA+IEJ1dCBubywgSSBkb24ndCB0aGluayBjb21wcm9taXNlIGlzIHJlbGV2
YW50LiAgSSB0aGluayB0aGUgcHJvYmxlbQo+ID4gPiA+IHN0YXRlbWVudCBhcyBvcmlnaW5hbGx5
IGdpdmVuIGJ5IEplZmYgaXMgbWlzbGVhZGluZywgYW5kIHBlb3BsZSBoYXZlCj4gPiA+ID4gYmVl
biBtaXNsZWQgdG8gYW4gaW5jb3JyZWN0IG5hbWUuCj4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IEknbSB1bmNsZWFyIHdoYXQgeW91ciBnb2FsIGlzIGluIHN1Z2dlc3RpbmcgdGhhdCBJIHJl
Y29tbWVuZCAid2UiIGdpdmUKPiA+ID4gPiA+IGludG8gYnVsbHlpbmcuIEFsbCBpdCBhY2hpZXZl
ZCB3YXMgdG8gZnVydGhlciBkZXJhaWwgdGhpcyB0aHJlYWQuCj4gPiA+ID4gPiAKPiA+ID4gPiAK
PiA+ID4gPiBUaGUgIldlIiBpcyB0aGUgc2FtZSBhcyB0aGUgInVzIiBpbiAibGV0J3MganVzdCBn
byB3aXRoIGl0Ii4KPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiA+IEkgYWxzbyB0aGluayBpdCdz
IG5vdCB2ZXJ5IGhlbHBmdWwgYXQgdjYgb2YgdGhlIGRpc2N1c3Npb24gdG8gc3RhcnQKPiA+ID4g
PiA+IGZpZ3VyaW5nIG91dCB3aGF0IHRoZSBhY3R1YWwga2V5IHJpZnQgYmV0d2VlbiBKZWZmJ3Mg
YW5kIENocmlzdG9waCdzCj4gPiA+ID4gPiBwb3NpdGlvbiBpcy4gSWYgeW91J3ZlIGZpZ3VyZWQg
aXQgb3V0IGFuZCBnb3R0ZW4gYW4gYWdyZWVtZW50IGFuZCB0aGlzCj4gPiA+ID4gPiBpcyBhbHJl
YWR5IGluLCBzZW5kIGEgZm9sbG93LXVwIHNlcmllcy4KPiA+ID4gPiAKPiA+ID4gPiB2Nj8gIHYy
IHdhcyBwb3N0ZWQgdG9kYXkuICBCdXQgbWF5YmUgeW91IGFyZSByZWZlcnJpbmcgdGhlIHNvbWUg
b3RoZXIKPiA+ID4gPiBwcmVjdXJzb3JzLgo+ID4gPiA+IAo+ID4gPiA+IFRoZSBpbnRyb2R1Y3Rv
cnkgc3RhdGVtZW50IGluIHYyIGlzCj4gPiA+ID4gCj4gPiA+ID4gICAgVGhpcyBwYXRjaHNldCBh
ZGRzIGEgZmxhZyB0aGF0IGluZGljYXRlcyB3aGV0aGVyIHRoZSBmaWxlc3lzdGVtIHN1cHBvcnRz
Cj4gPiA+ID4gICAgc3RhYmxlIGZpbGVoYW5kbGVzIChpLmUuIHRoYXQgdGhleSBkb24ndCBjaGFu
Z2Ugb3ZlciB0aGUgbGlmZSBvZiB0aGUKPiA+ID4gPiAgICBmaWxlKS4gSXQgdGhlbiBtYWtlcyBh
bnkgZmlsZXN5c3RlbSB0aGF0IGRvZXNuJ3Qgc2V0IHRoYXQgZmxhZwo+ID4gPiA+ICAgIGluZWxp
Z2libGUgZm9yIG5mc2QgZXhwb3J0Lgo+ID4gPiA+IAo+ID4gPiA+IE5vYm9keSBlbHNlIHF1ZXN0
aW9uZWQgdGhlIHZhbGlkaXR5IG9mIHRoYXQuICBJIGRvLgo+ID4gPiA+IE5vIGV2aWRlbmNlIHdh
cyBnaXZlbiB0aGF0IHRoZXJlIGFyZSAqYW55KiBmaWxlc3lzdGVtcyB0aGF0IGRvbid0Cj4gPiA+
ID4gc3VwcG9ydCBzdGFibGUgZmlsZWhhbmRsZXMuICBUaGUgb25seSBmaWxlc3lzdGVtIG1lbnRp
b25lZCBpcyBjZ3JvdXBzCj4gPiA+ID4gYW5kIGl0IERPRVMgcHJvdmlkZSBzdGFibGUgZmlsZWhh
bmRsZXMuCj4gPiA+IAo+ID4gCj4gPiBBY3Jvc3MgcmVib290PyBOb3QgcmVhbGx5Lgo+IAo+IEFj
cm9zcyByZWJvb3QgYWxsIHRoZSBmaWxlcyBhcmUgZGVsZXRlZCBhbmQgdGhlbiBuZXcgb25lcyBh
cmUgY3JlYXRlZC4KPiBTbyB0aGVyZSBpcyBub3RoaW5nIHRoYXQgbmVlZHMgdG8gYmUgc3RhYmxl
Lgo+IAo+ID4gCj4gPiBJdCdzIHF1aXRlIHBvc3NpYmxlIHRoYXQgd2UgbWF5IGVuZCB1cCB3aXRo
IHRoZSBzYW1lICJpZCIgbnVtYmVycyBpbgo+ID4gY2dyb3VwZnMgb24gYSBuZXcgaW5jYXJuYXRp
b24gb2YgdGhlIGZpbGVzeXN0ZW0gYWZ0ZXIgYSByZWJvb3QuIFRoZQo+ID4gZmlsZXMgaW4gdGhl
cmUgYXJlIG5vdCB0aGUgc2FtZSBvbmVzIGFzIHRoZSBvbmVzIGJlZm9yZSwgYnV0IHRoZWlyCj4g
PiBmaWxlaGFuZGxlcyBtYXkgbWF0Y2ggYmVjYXVzZSBrZXJuZnMgZG9lc24ndCBmYWN0b3IgaW4g
YW4gaV9nZW5lcmF0aW9uCj4gPiBudW1iZXIuCj4gCj4gVGhhdCBpcyBpcyBhYm91dCBmaWxlaGFu
ZGxlIHJlLXVzZSwgbm90IGFib3V0IGZpbGVoYW5kbGUgc3RhYmlsaXR5Lgo+IAo+ID4gCj4gPiBD
b3VsZCB3ZSBmaXggaXQgYnkgYWRkaW5nIGEgcmFuZG9tIGlfZ2VuZXJhdGlvbiB2YWx1ZSBvciBz
b21ldGhpbmc/Cj4gPiBQb3NzaWJseSwgYnV0IHRoZXJlIHJlYWxseSBpc24ndCBhIGdvb2QgdXNl
LWNhc2UgdGhhdCBJIGNhbiBzZWUgZm9yCj4gPiBhbGxvd2luZyBjZ3JvdXBmcyB0byBiZSBleHBv
cnRlZCB2aWEgbmZzZC4gQmVzdCB0byBkaXNhbGxvdyBpdCB1bnRpbAo+ID4gc29tZW9uZSBjb21l
cyB1cCB3aXRoIG9uZS4KPiAKPiAxMDAlIGFncmVlLgo+IAo+ID4gCj4gPiA+IE9oIHllcyB3ZSBk
aWQuIEFuZCB0aGlzIGlzIGEgbWVycnktZ28tcm91bmQuCj4gPiA+IAo+ID4gPiBJdCBpcyB2ZXJ5
IG11Y2ggZmluZSBmb3IgYSBmaWxlc3lzdGVtcyB0byBzdXBwb3J0IGZpbGUgaGFuZGxlcyB3aXRo
b3V0Cj4gPiA+IHdhbnRpbmcgdG8gc3VwcG9ydCBleHBvcnRpbmcgdmlhIE5GUy4gVGhhdCBpcyBl
c3BlY2lhbGx5IHRydWUgZm9yCj4gPiA+IGluLWtlcm5lbCBwc2V1ZG8gZmlsZXN5c3RlbXMuCj4g
PiA+IAo+ID4gPiBBcyBJJ3ZlIHNhaWQgYmVmb3JlIG11bHRpcGxlIHRpbWVzIEkgd2FudCBhIHdh
eSB0byBhbGxvdyBmaWxlc3lzdGVtcwo+ID4gPiBzdWNoIGFzIHBpZGZzIGFuZCBuc2ZzIHRvIHVz
ZSBmaWxlIGhhbmRsZXMgd2l0aG91dCBzdXBwb3J0aW5nIGV4cG9ydC4KPiA+ID4gV2hhdGV2ZXIg
dGhhdCBmc2NraW5nIGZsYWcgaXMgY2FsbGVkIGF0IHRoaXMgcG9pbnQgSSBmdW5kYW1lbnRhbGx5
IGRvbid0Cj4gPiA+IGNhcmUuIEFuZCB3ZSBhcmUgcmVsaXZpbmcgdGhlIHNhbWUgYXJndW1lbnRz
IG92ZXIgYW5kIG92ZXIuCj4gPiA+IAo+ID4gPiBJIHdpbGwgX2hhcmQgTkFLXyBhbnl0aGluZyB0
aGF0IHN0YXJ0cyBtYW5kYXRpbmcgdGhhdCBleHBvcnQgb2YKPiA+ID4gZmlsZXN5c3RlbXMgbXVz
dCBiZSBhbGxvd2VkIHNpbXBseSBiZWNhdXNlIHRoZWlyIGZpbGUgaGFuZGxlcyBmaXQgZXhwb3J0
Cj4gPiA+IGNyaXRlcmlhLiBJIGRvIG5vdCBjYXJlIHdoZXRoZXIgcGlkZnMgb3IgbnNmcyBmaWxl
IGhhbmRsZXMgZml0IHRoZSBiaWxsLgo+ID4gPiBUaGV5IHdpbGwgbm90IGJlIGV4cG9ydGVkLgo+
ID4gCj4gPiBJIGRvbid0IHJlYWxseSBjYXJlIHdoYXQgd2UgY2FsbCB0aGUgZmxhZy4gSSBkbyBj
YXJlIGEgbGl0dGxlIGFib3V0Cj4gPiB3aGF0IGl0cyBzZW1hbnRpY3MgYXJlLCBidXQgdGhlIGVm
ZmVjdCBzaG91bGQgYmUgdG8gZW5zdXJlIHRoYXQgZnMKPiA+IG1haW50YWluZXJzIG1ha2UgYSBj
b25zY2lvdXMgZGVjaXNpb24gYWJvdXQgd2hldGhlciBuZnNkIGV4cG9ydCBzaG91bGQKPiA+IGJl
IGFsbG93ZWQgb24gdGhlIGZpbGVzeXN0ZW0uwqAKPiAKPiBXaHkgZG8geW91IG5lZWQgYSBjb25z
Y2lvdXMgZGVjaXNpb24gc28gbXVjaCB0aGF0IHlvdSB3YW50IHRvIHRyeSB0bwo+IGZvcmNlIGl0
LgoKQXMgSSBzYWlkIGJlZm9yZSwgZmlsZXN5c3RlbXMgYXJlIGdyb3dpbmcgZXhwb3J0X29wZXJh
dGlvbnMgZm9yIG90aGVyCnJlYXNvbnMgdGhhbiBuZnMgZXhwb3J0LiBJIHNpbXBseSB3YW50IHRv
IHRoZSBmcyBtYWludGFpbmVycyB0byB0YWtlIGEKY29uc2Npb3VzIHN0ZXAgdG8gc2F5ICJ5ZXMs
IHRoaXMgc2hvdWxkIGJlIGF2YWlsYWJsZSB2aWEgbmZzZCBpZiBpdCdzCmV4cG9ydGVkIi4gSG9w
ZWZ1bGx5IHRoZXknbGwgYWxzbyB2YWxpZGF0ZSB0aGF0IGl0IGFjdHVhbGx5IF93b3Jrc18KdG9v
LgoKPiBPZiBjb3Vyc2Ugd2Ugd2FudCBjb25zY2lvdXMgZGVjaXNpb25zIGFuZCBob3BlIHRoZXkg
YXJlIGFsd2F5cyBtYWRlLCBidXQKPiB0cnlpbmcgdG8gbWFuaXB1bGF0ZSBwZW9wbGUgdG8gZG9p
bmcgdGhpbmdzIG9mdGVuIGZhaWxzLiAgSG93IHN1cmUgYXJlCj4geW91IHRoYXQgZnMgZGV2ZWxv
cGVycyB3b24ndCBqdXN0IGNvcHktcGFzdGUgc29tZSBvdGhlciBpbXBsZW1lbnRhdGlvbgo+IGFu
ZCBub3QgdGhpbmsgYWJvdXQgdGhlIGltcGxpY2F0aW9ucyBvZiB0aGUgZmxhZz8KPgo+IFdoYXQg
aXMgdGhlIGRvd24gc2lkZT8gIFdoYXQgaXMgdGhlIGhhcm0gZnJvbSBhbGxvd2luZyBleHBvcnQg
KHNob3VsZCB0aGUKPiBhZG1pbiBhdHRlbXB0IGl0KT8KPiBJZiB0aGVyZSB3ZXJlIHNlcmlvdXMg
c2VjdXJpdHkgY29uY2VybnMgLSB0aGVuIHN1cmUsIG1ha2UgaXQgaGFyZGVyIHRvCj4gZG8gdGhl
IGRhbmdlcm91cyB0aGluZy4KPiBCdXQgaWYgaXQgaXMganVzdCAiaXQgZG9lc24ndCBtYWtlIHNl
bnNlIiwgdGhlbiB0aGVyZSBpcyBubyBoYXJtIGluCj4gbGV0dGluZyBwZW9wbGUgZ2V0IGF3YXkg
d2l0aCBub3QgcmVhZGluZyB0aGUgZG9jdW1lbnRhdGlvbiwgYW5kIGZpeGluZwo+IHRoaW5ncyBs
YXRlciBhcyBjb21wbGFpbnRzIGFycml2ZS4gIFRoYXQgaXMgZ2VuZXJhbGx5IGhvdyB0aGUgcHJv
Y2Vzcwo+IHdvcmtzLgo+IAoKU29tZSBvZiB0aGUgbW9yZSBleG90aWMgZmlsZXN5c3RlbXMgY291
bGQgZW5kIHVwIGNhdXNpbmcga2VybmVsIHBhbmljcwpvciBzb21ldGhpbmcgaWYgZXhwb3J0ZWQg
d2hlbiB0aGV5IGhhdmVuJ3QgYmVlbiB2YWxpZGF0ZWQgdG8gYWN0dWFsbHkKd29yayB3aXRoIG5m
c2QuIFRoYXQncyBtb3N0bHkgRlVEIHRob3VnaCAtLSBJIGRvbid0IGhhdmUgYW55IGV4YW1wbGVz
LgoKPiBCdXQgaWYgeW91IHJlYWxseSByZWFsbHkgd2FudCB0byBzZXQgdGhpcyBuZXcgZmxhZyBv
biBhbG1vc3QgZXZlcnkKPiBleHBvcnRfb3BlcmF0aW9ucywgY2FuIEkgYXNrIHRoYXQgeW91IHBs
ZWFzZSBzZXQgaXQgb24gRVZFUlkgZXhwb3J0Cj4gb3BlcmF0aW9ucywgdGhlbiBhbGxvdyBtYWlu
dGFpbmVycyB0byByZW1vdmUgaXQgYXMgdGhleSBzZWUgZml0Lgo+IEkgdGhpbmsgdGhhdCBhcHBy
b2FjaCB3b3VsZCBiZSBtdWNoIGVhc2llciB0byByZXZpZXcuCj4gCgpXZSBjb3VsZCBwcm9iYWJs
eSBkbyB0aGF0LCBidXQgSSB0aGluayB0aGUgbWFpbiBvbmVzIHRoYXQgZXhjbHVkZXMgaXQKYXJl
IGtlcm5mcywgcGlkZnMgYW5kIG5zZnMuIG92bCBhbmQgZnVzZSBhbHNvIGhhdmUgZXhwb3J0IG9w
cyBpbgpjZXJ0YWluIG1vZGVzIHRoYXQgZXhjbHVkZSBORlMgYWNjZXNzLCBzbyB0aGUgZmxhZyB3
YXMgbGVmdCBvZmYgb2YKdGhvc2UgYXMgd2VsbC4KCj4gV2l0aCB5b3VyIGN1cnJlbnQgc2VyaWVz
IGl0IGlzIG5vbi10cml2aWFsIHRvIGRldGVybWluZSB3aGljaAo+IGV4cG9ydF9vcGVyYXRpb25z
IHlvdSBoYXZlIGNob3NlbiBub3QgdG8gc2V0IHRoZSBmbGFnIG9uLiAgSWYgeW91IGhhZAo+IG9u
ZSBwYXRjaCB0aGF0IHNldCBpdCBldmVyeXdoZXJlLCB0aGVuIGluZGl2aWR1YWwgcGF0Y2hlcyB0
byByZW1vdmUgaXQsCj4gdGhhdCB3b3VsZCBiZSBhIGxvdCBlYXNpZXIgdG8gcmV2aWV3LgoKTm90
ZWQuIEF0IHRoaXMgcG9pbnQgSSdtIGRlYmF0aW5nIHdoZXRoZXIgdG8gcHVyc3VlIHRoaXMgZnVy
dGhlciwgb3IKanVzdCBkcm9wIHRoaXMgZm9yIG5vdyB1bnRpbCB3ZSBjYW4gY29tZSB0byBhIGJl
dHRlciBjb25zZW5zdXMuIE1heWJlCndlIG5lZWQgYSBkaXNjdXNzaW9uIGFib3V0IHRoaXMgYXQg
TFNGPwoKLS0gCkplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
